import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/providers/user.dart';

class DiscussionPage extends StatefulWidget {
  const DiscussionPage({super.key});

  @override
  State<DiscussionPage> createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // Récupération initiale des users
    print(userProvider.fetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    // bool isFeached = true;

    return Column(
    children: [
        Expanded(
          child: Consumer<UserProvider>(
            builder: (context, provider, child) {
              if (provider.users.isEmpty) {
                return Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      strokeWidth: 7,
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: provider.users.length,
                  itemBuilder: (context, index) {
                    final user = provider.users[index];
                    return ListTile(
                      leading: SizedBox(
                        width: 20,
                        child: Icon(Icons.person,size: 20,),
                      ) ,
                      title: Text(style: TextStyle(), user.name),
                      subtitle: Text(user.phone_number),
                      trailing: Text(user.email),

                      onTap: () {
                        print( user.name);
                      },
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
