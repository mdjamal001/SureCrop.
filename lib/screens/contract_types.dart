import 'package:flutter/material.dart';

import 'contract_details_page.dart';

class ContractTemplatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Contract Templates'),
        titleSpacing: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a Contract Type:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            // Contract Template List
            Expanded(
              child: ListView(
                children: [
                  _buildContractOption(context, 'Standard Contract'),
                  _buildContractOption(context, 'Fixed-Price Contract'),
                  _buildContractOption(context, 'Cost-Plus Contract'),
                  _buildContractOption(context, 'Input-Output Contract'),
                  _buildContractOption(context, 'Production Support Contract'),
                  _buildContractOption(context, 'Market-Linked Contract'),
                  _buildContractOption(context, 'Labor Service Contract'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build each contract option
  Widget _buildContractOption(BuildContext context, String contractName) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2,
      child: ListTile(
        title: Text(
          contractName,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.info_outline,size: 20,),
          onPressed: () {
            _showContractDetailsDialog(context, contractName);
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContractDetailsPage()),
          );
        },
      ),
    );
  }

  // Method to show contract details in a dialog box
  void _showContractDetailsDialog(BuildContext context, String contractName) {
    String contractDetails;

    // Add detailed descriptions for each contract type here
    switch (contractName) {
      case 'Standard Contract':
        contractDetails = '''A Standard Contract is a legally binding agreement between two parties, typically used in business transactions. It outlines the responsibilities, obligations, and expectations of both parties. This type of contract includes standard terms and conditions, such as payment terms, delivery schedules, and dispute resolution mechanisms. Standard contracts are often used in procurement, services, and supply chain agreements. They are straightforward and commonly used for routine transactions between businesses or individuals. This contract type ensures both parties fulfill their obligations under the agreed terms.''';
        break;
      case 'Fixed-Price Contract':
        contractDetails = '''A Fixed-Price Contract is a type of agreement where the price for the work or services is fixed at the outset and remains constant throughout the contract period. This contract is typically used when the scope of work is clearly defined, and both parties agree on a set price for the completion of the project. Fixed-price contracts are common in construction, manufacturing, and software development. The benefit is that it reduces financial risk for the buyer, as they know the total cost upfront. However, any unforeseen cost increases are the responsibility of the seller.''';
        break;
      case 'Cost-Plus Contract':
        contractDetails = '''A Cost-Plus Contract, also known as a Cost-Reimbursement Contract, is a type of agreement where the buyer agrees to reimburse the seller for the actual costs incurred during the project, plus an additional fee or profit margin. This contract type is typically used in projects where the scope of work is uncertain, and it’s difficult to estimate costs accurately. The seller submits detailed cost reports to the buyer, and the buyer pays for labor, materials, and other expenses. This contract is common in government contracts, research and development, and construction projects.''';
        break;
      case 'Input-Output Contract':
        contractDetails = '''An Input-Output Contract is a type of contract commonly used in agriculture, manufacturing, and production industries. In this contract, one party agrees to supply inputs (such as raw materials, seeds, or machinery) to another party, who agrees to produce a certain output (such as crops or finished goods). The contract outlines the responsibilities of both parties regarding the input supply and the production process. This contract type is beneficial for ensuring that both parties are aligned in terms of production goals and expectations and helps manage risk related to supply and output.''';
        break;
      case 'Production Support Contract':
        contractDetails = '''A Production Support Contract is a type of agreement where one party agrees to provide ongoing support and assistance to another party throughout the production process. This may include providing technical expertise, training, maintenance services, and other resources necessary for successful production. This contract is commonly used in industries such as agriculture, manufacturing, and IT, where continuous support is critical to ensuring quality production and meeting deadlines. This contract ensures that the producer has the necessary support to maintain productivity and quality standards.''';
        break;
      case 'Market-Linked Contract':
        contractDetails = '''A Market-Linked Contract is a type of agreement in which the pricing of goods or services is directly linked to market conditions, such as supply and demand or commodity prices. This contract is commonly used in agriculture, commodities, and energy markets, where prices can fluctuate significantly over time. The contract specifies that the price of the goods or services will be adjusted based on a predefined market index or price benchmark. This contract helps both parties manage the risk of price volatility and ensures that the seller receives fair compensation based on current market conditions.''';
        break;
      case 'Labor Service Contract':
        contractDetails = '''A Labor Service Contract is an agreement where one party agrees to provide labor or services to another party for a specific project or task. This type of contract is commonly used in construction, manufacturing, and other industries that require manual labor. The contract outlines the scope of the work, the payment terms, and the responsibilities of both parties. Labor service contracts can be short-term or long-term, depending on the nature of the work. They ensure that both parties understand their obligations and that workers are fairly compensated for their services.''';
        break;
      default:
        contractDetails = 'No details available for this contract type.';
    }

    // Show the dialog box with the contract details
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(contractName),
          content: SingleChildScrollView(
            child: Text(contractDetails),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
