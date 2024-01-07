import 'package:flutter/material.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.home.aboutOurAirLines),
        forceMaterialTransparency: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: appPaddingSmall),
        child: Card(
          elevation: 5,
          // padding: EdgeInsets.all(appPaddingSmall),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(appPaddingSmall),
              child: Text(
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget fermentum nibh, at finibus metus. Nunc dolor arcu, dapibus ut sagittis sit amet, rhoncus sit amet nibh. Nulla eu pretium diam. Phasellus ut leo quis turpis elementum consectetur. Integer pellentesque tempus erat ac interdum. Proin mi nibh, pharetra et accumsan eget, varius eu diam. Praesent rhoncus nunc a purus aliquet, at imperdiet lacus imperdiet. Phasellus sit amet massa id turpis porta bibendum fringilla vehicula lorem. Nulla tincidunt velit a sem commodo, ut cursus elit bibendum. Etiam orci leo, facilisis ac magna sit amet, elementum convallis neque. Cras sit amet bibendum turpis.
                  
                  Nullam convallis aliquet dictum. Nulla sollicitudin viverra ligula eu elementum. Ut fermentum est non justo euismod, id sodales enim bibendum. Praesent porttitor nisi quis elit commodo euismod. Curabitur cursus dolor vitae quam auctor, vitae iaculis sapien sagittis. Donec nunc augue, fermentum et orci ut, aliquam semper turpis. Nullam augue urna, sodales in velit vel, gravida consequat enim. Aenean quis urna nec lacus luctus pharetra ac ut velit. Ut fermentum varius felis eu cursus. Ut lobortis bibendum arcu id convallis.
                  
                  Praesent consequat libero velit, quis suscipit diam commodo et. Curabitur tincidunt urna eget iaculis consequat. Praesent aliquam sem at pulvinar condimentum. Praesent aliquet, neque nec laoreet aliquet, dolor diam pretium odio, in faucibus nulla ligula ac velit. In pharetra mauris urna, quis luctus justo dapibus a. Integer nec quam non metus luctus faucibus non vel neque. Proin pretium, eros et efficitur tempus, quam lacus egestas ex, dignissim imperdiet nisl tortor placerat arcu. Etiam imperdiet purus at accumsan porttitor. Nullam aliquam suscipit lacinia. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris porttitor augue ut neque feugiat egestas. Suspendisse potenti. Integer bibendum porta enim, vitae venenatis eros. Proin sit amet nibh nec eros elementum porttitor. Quisque sed mattis nibh.
                  
                  Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed finibus sodales convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed nec velit volutpat, hendrerit ante sed, tempus lacus. Maecenas quis est vel nisl faucibus suscipit. Donec neque mauris, imperdiet vitae nibh non, gravida maximus magna. Praesent ac lobortis purus. Donec cursus sapien vel euismod posuere.
                  
                  Maecenas feugiat urna nec quam consequat facilisis. Fusce tristique efficitur libero, a congue nibh congue ac. Fusce ac nisl tristique, dictum nulla non, rutrum libero. Nulla eget ligula porttitor, lobortis augue at, faucibus justo. Praesent id vestibulum dui, sed aliquam neque. Suspendisse malesuada vel quam nec elementum. Quisque eget ligula rutrum urna rutrum semper non eget est.
                  '''),
            ),
          ),
        ),
      ),
    );
  }
}
