GDPC                                                                                @   res://.import/black.png-19a8df0b1a4edb74ea2eecb66d46d03d.stex   �@      i       +��'��w2}Vޑ<   res://.import/gate.png-a12930027a89789f88c7372eae9b4450.stex0D      ~        ����-�v�^f�ܴ@   res://.import/hazard.png-70c5ddec35e8598a6a92b8952b430991.stex  0G      u        �K3ҭ>��XO�<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex@J      �      �p��<f��r�g��.�@   res://.import/purple.png-993a3fae7325db95475822da4ec84ea6.stex  `Z      r       �X�����})�2t+P@   res://.import/white.png-d8533361663a5f8fe5200e5b5262a62d.stex   p]      r       ��ڮ����Ed�   res://Area2D.gd.remap   �`      !       d1 Ok�k�:�U���h   res://Area2D.gdcP      �       ����R<�^��e��   res://Gate.gd.remap �`             �p���~�����B�{�   res://Gate.gdc        �      ���{Y{��� �@3�0   res://Gate.tscn �	      /      �,I=J���{�ę��g   res://Hazard.gd.remap   �`      !       wجTL�V���u0PN   res://Hazard.gdc       �      j�Z�!��؍�-�   res://Hazard.tscn   �      !      U�M��֨������~   res://Scene.gd.remap a              ��@����ĵ#���G�   res://Scene.gdc �      �      �<�5f��K-2�(���   res://Scene.tscn�      }      *�"����0�����   res://Scene2.tscn    /      }      *�"����0�����   res://black.png.import  �@      �      $��Sp�z���h��   res://default_env.tres  �C      �       um�`�N��<*ỳ�8   res://gate.png.import   �D      �      ������M������@�   res://hazard.png.import �G      �      gǪ	�ᚻ3p�#=   res://icon.png   a      i      ����󈘥Ey��
�   res://icon.png.import   �W      �      �����%��(#AB�   res://project.binary�n      �      qV)*-�`_�6�q\�S   res://purple.png.import �Z      �      =0@^�j}6շdR '   res://white.png.import  �]      �      ��!\����8G?gC        GDSC                   ���ׄ�   �����϶�                                                    	      
                           3YYYYYYY0�  PQV�  -YYYYY`    GDSC            <      ���ׄ�   ���������Ӷ�   �����϶�   ��������������������Ҷ��   ���϶���   ���Ӷ���   �������Ӷ���   �����������Ӷ���      Player        player here                                                     	      
                                       "      *      /      8      :      3YYYYY8;�  V�  YY0�  PQV�  -YYYYYYY0�  P�  QV�  &�  T�  V�  �8  P�  Q�  �  PQT�  P�  Q�  -Y`             [gd_scene load_steps=4 format=2]

[ext_resource path="res://Gate.gd" type="Script" id=1]
[ext_resource path="res://gate.png" type="Texture" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 8, 24 )

[node name="Gate" type="Area2D"]
script = ExtResource( 1 )
next_scene = "res://Scene2.tscn"

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="Sprite" type="Sprite" parent="."]
texture = ExtResource( 2 )
[connection signal="body_entered" from="." to="." method="_on_Gate_body_entered"]
 GDSC            1      ���������τ򶶶�   �����϶�   �������ׄ�������������Ҷ   ���϶���   ���Ӷ���   �������Ӷ���   �������������������Ӷ���      Player                                                      	      
                                             %      -      /      3YYYYYYY0�  PQV�  -YYYYYYY0�  P�  QV�  &�  T�  V�  �  PQT�  PQ�  -Y`      [gd_scene load_steps=5 format=2]

[ext_resource path="res://Hazard.gd" type="Script" id=1]
[ext_resource path="res://hazard.png" type="Texture" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 8, 8 )

[sub_resource type="SegmentShape2D" id=2]
a = Vector2( 0, -8 )
b = Vector2( 0, 8 )

[node name="Hazard" type="StaticBody2D"]
script = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="Sprite" type="Sprite" parent="."]
texture = ExtResource( 2 )

[node name="Area2D" type="Area2D" parent="."]

[node name="CollisionShape2D" type="CollisionShape2D" parent="Area2D"]
position = Vector2( -10, 0 )
shape = SubResource( 2 )
[connection signal="body_entered" from="Area2D" to="." method="_on_Area2D_body_entered"]
               GDSC   .      p   4     ���ӄ�   ������ƶ   ������ƶ   �����Ķ�   ������������τ�   �����Ķ�   ������釶���   ���ׄ�   �����ڇ�   ������鄶���   �����ڄ�   ����������   �������   ��������   ��������   ���涶��   ������������   ������Ӷ   �������¶���   ����������¶   ��������������釶���   ��������������鄶���   �����϶�   �������Ŷ���   ����׶��   ����¶��   �����������������¶�   ����������Ķ   ����¶��   ���������������������Ҷ�   ϶��   ������������¶��   �����¶�   �����������ض���   ζ��   ��������������ض   ������Ҷ   �������ض���   �������������Ӷ�   �涶   ���������������Ŷ���   ����������������Ҷ��   ���������ڇ������������Ҷ���   ���϶���   ���Ӷ���   ���������ڄ������������Ҷ���   2     ������#@         
      d                          	   ui_accept         q      Z         e         ui_right      ui_left             Player                                              +      ,      -   	   3   
   ;      A      G      N      T      U      Z      b      g      m      s      t      u      v      |      }            �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4   �   5   �   6     7     8     9     :   #  ;   +  <   :  =   ?  >   @  ?   D  @   E  A   F  B   S  C   T  D   U  E   V  F   _  G   c  H   d  I   m  J   q  K   r  L   �  M   �  N   �  O   �  P   �  Q   �  R   �  S   �  T   �  U   �  V   �  W   �  X   �  Y   �  Z   �  [   �  \   �  ]   �  ^   �  _   �  `   �  a      b     c     d     e     f     g     h     i     j     k     l   $  m   ,  n   0  o   2  p   3YY5;�  V�  W�  Y5;�  V�  W�  Y5;�  V�  W�  �  Y5;�	  V�  W�  �
  YYY8;�  Y8;�  �  �  Y8;�  �  Y8;�  �  Y8;�  �  Y8;�  �  YY;�  �  Y;�  V�  PQY;�  �  Y;�  V�  Y;�  V�  YYYY0�  PQV�  �  -YYY0�  P�  QV�  �  �  ;�  �  PQ�  �  &�  T�  PQ�  T�  P�  QV�  �  T�  �  �  (V�  �  T�  �  �  �  �  ;�  �  �  �  T�  �  �  ;�   �  �  �  ;�!  Y�  &�  �  T�"  �  V�  �!  �  �  (V�  �!  �  �  �  �  �  P�  R�  P�   R�  QR�!  �  Q�  �  T�"  �  T�"  �  �  �  &�  V�  �  T�#  �	  T�#  �  �8  P�  Q�  �  �  T�$  P�  T�%  �	  T�%  Q�  �  �  �  '�  V�  �  T�#  �  T�#  �  �  �  T�$  P�	  T�%  �  T�%  Q�  �8  P�  Q�  �  �  �  �  �  �  �  �  T�&  P�  R�  T�'  QY�  �  �  &�  T�  P�	  QV�  �  �
  �  �  '�  T�  P�  QV�  �  �
  �  �  �  T�(  �  P�  T�(  R�  R�  �  Q�  �  YY0�  PQX�  V�  &P�  T�)  P�  Q�  T�)  P�  QQV�  �  �  �  .�  �  �  &�  T�)  P�  Q�  T�)  P�  QV�  �  �  �  .�  �  �  &�  T�)  P�  Q�  T�)  P�  QV�  �  �  �  .�  �  �  &�  �  �  T�)  P�  QV�  .�  �  �  &�  �  �  T�)  P�  QV�  .�  �  �  .�  YYY0�*  P�+  QV�  &�+  T�,  �  V�  �  �  �  -YYY0�-  P�+  QV�  &�+  T�,  �  V�  �  �  �  -Y`            [gd_scene load_steps=12 format=2]

[ext_resource path="res://Scene.gd" type="Script" id=1]
[ext_resource path="res://white.png" type="Texture" id=2]
[ext_resource path="res://hazard.png" type="Texture" id=3]
[ext_resource path="res://Hazard.tscn" type="PackedScene" id=4]
[ext_resource path="res://Gate.tscn" type="PackedScene" id=5]
[ext_resource path="res://purple.png" type="Texture" id=6]

[sub_resource type="ConvexPolygonShape2D" id=1]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=2]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="TileSet" id=3]
0/name = "white.png 0"
0/texture = ExtResource( 2 )
0/tex_offset = Vector2( 0, 0 )
0/modulate = Color( 1, 1, 1, 1 )
0/region = Rect2( 0, 0, 16, 16 )
0/tile_mode = 0
0/occluder_offset = Vector2( 0, 0 )
0/navigation_offset = Vector2( 0, 0 )
0/shapes = [ {
"autotile_coord": Vector2( 0, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 1 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
} ]
0/z_index = 0
1/name = "hazard.png 1"
1/texture = ExtResource( 3 )
1/tex_offset = Vector2( 0, 0 )
1/modulate = Color( 1, 1, 1, 1 )
1/region = Rect2( 0, 0, 16, 16 )
1/tile_mode = 0
1/occluder_offset = Vector2( 0, 0 )
1/navigation_offset = Vector2( 0, 0 )
1/shapes = [ {
"autotile_coord": Vector2( 0, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 2 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
} ]
1/z_index = 0

[sub_resource type="SegmentShape2D" id=4]
a = Vector2( -24, 0 )
b = Vector2( 24, 0 )

[sub_resource type="RectangleShape2D" id=5]
extents = Vector2( 8, 8 )

[node name="Scene" type="Node2D"]
script = ExtResource( 1 )
MOVE_SPEED = 150
GRAVITY = 500.0
ACCEL = 40
JUMP = -150

[node name="TileMap" type="TileMap" parent="."]
position = Vector2( 128, 128 )
tile_set = SubResource( 3 )
cell_size = Vector2( 16, 16 )
format = 1
tile_data = PoolIntArray( -458760, 0, 0, -458759, 0, 0, -458758, 0, 0, -458757, 0, 0, -458756, 0, 0, -458755, 0, 0, -458754, 0, 0, -458753, 0, 0, -524288, 0, 0, -524287, 0, 0, -524286, 0, 0, -524285, 0, 0, -524284, 0, 0, -524283, 0, 0, -524282, 0, 0, -524281, 0, 0, -458751, 0, 0, -458745, 0, 0, -393215, 0, 0, -393209, 0, 0, -327679, 0, 0, -327673, 0, 0, -196616, 0, 0, -262143, 0, 0, -262137, 0, 0, -131080, 0, 0, -196607, 0, 0, -196601, 0, 0, -65544, 0, 0, -131071, 0, 0, -131065, 0, 0, -8, 0, 0, -65535, 0, 0, -65529, 0, 0, 65528, 0, 0, 1, 0, 0, 131064, 0, 0, 196600, 0, 0, 262136, 0, 0, 196615, 0, 0, 327672, 0, 0, 262151, 0, 0, 393208, 0, 0, 327687, 0, 0, 458744, 0, 0, 393223, 0, 0, 524280, 0, 0, 524281, 0, 0, 524282, 0, 0, 524283, 0, 0, 524284, 0, 0, 524285, 0, 0, 458753, 0, 0, 458754, 0, 0, 458755, 0, 0, 458756, 0, 0, 458757, 0, 0, 458758, 0, 0, 458759, 0, 0 )

[node name="Portal1" type="Area2D" parent="TileMap"]
editor/display_folded = true
position = Vector2( -8, 112 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="TileMap/Portal1"]
position = Vector2( 0, 16 )
shape = SubResource( 4 )

[node name="Portal2" type="Area2D" parent="TileMap"]
editor/display_folded = true
position = Vector2( 112, 24 )
rotation = -1.57079

[node name="CollisionShape2D" type="CollisionShape2D" parent="TileMap/Portal2"]
position = Vector2( 3.05176e-005, 16 )
shape = SubResource( 4 )

[node name="Hazard" parent="TileMap" instance=ExtResource( 4 )]
position = Vector2( 8, 8 )
rotation = -1.57079

[node name="Hazard2" parent="TileMap" instance=ExtResource( 4 )]
position = Vector2( -104, 8 )
rotation = -1.57079

[node name="Hazard3" parent="TileMap" instance=ExtResource( 4 )]
position = Vector2( -88, 8 )
rotation = -1.57079

[node name="Hazard4" parent="TileMap" instance=ExtResource( 4 )]
position = Vector2( -72, 8 )
rotation = -1.57079

[node name="Hazard5" parent="TileMap" instance=ExtResource( 4 )]
position = Vector2( -56, 8 )
rotation = -1.57079

[node name="Gate" parent="TileMap" instance=ExtResource( 5 )]
position = Vector2( -120, -88 )

[node name="Player" type="KinematicBody2D" parent="."]
position = Vector2( 88, 184 )
__meta__ = {
"_edit_group_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="Player"]
shape = SubResource( 5 )

[node name="Sprite" type="Sprite" parent="Player"]
texture = ExtResource( 6 )
[connection signal="body_entered" from="TileMap/Portal1" to="." method="_on_Portal1_body_entered"]
[connection signal="body_entered" from="TileMap/Portal2" to="." method="_on_Portal2_body_entered"]
   [gd_scene load_steps=12 format=2]

[ext_resource path="res://Scene.gd" type="Script" id=1]
[ext_resource path="res://white.png" type="Texture" id=2]
[ext_resource path="res://hazard.png" type="Texture" id=3]
[ext_resource path="res://Hazard.tscn" type="PackedScene" id=4]
[ext_resource path="res://Gate.tscn" type="PackedScene" id=5]
[ext_resource path="res://purple.png" type="Texture" id=6]

[sub_resource type="ConvexPolygonShape2D" id=1]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=2]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="TileSet" id=3]
0/name = "white.png 0"
0/texture = ExtResource( 2 )
0/tex_offset = Vector2( 0, 0 )
0/modulate = Color( 1, 1, 1, 1 )
0/region = Rect2( 0, 0, 16, 16 )
0/tile_mode = 0
0/occluder_offset = Vector2( 0, 0 )
0/navigation_offset = Vector2( 0, 0 )
0/shapes = [ {
"autotile_coord": Vector2( 0, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 1 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
} ]
0/z_index = 0
1/name = "hazard.png 1"
1/texture = ExtResource( 3 )
1/tex_offset = Vector2( 0, 0 )
1/modulate = Color( 1, 1, 1, 1 )
1/region = Rect2( 0, 0, 16, 16 )
1/tile_mode = 0
1/occluder_offset = Vector2( 0, 0 )
1/navigation_offset = Vector2( 0, 0 )
1/shapes = [ {
"autotile_coord": Vector2( 0, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 2 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
} ]
1/z_index = 0

[sub_resource type="SegmentShape2D" id=4]
a = Vector2( -24, 0 )
b = Vector2( 24, 0 )

[sub_resource type="RectangleShape2D" id=5]
extents = Vector2( 8, 8 )

[node name="Scene" type="Node2D"]
script = ExtResource( 1 )
MOVE_SPEED = 150
GRAVITY = 500.0
ACCEL = 40
JUMP = -150

[node name="TileMap" type="TileMap" parent="."]
position = Vector2( 128, 128 )
tile_set = SubResource( 3 )
cell_size = Vector2( 16, 16 )
format = 1
tile_data = PoolIntArray( -458760, 0, 0, -458759, 0, 0, -458758, 0, 0, -458757, 0, 0, -458756, 0, 0, -458755, 0, 0, -458754, 0, 0, -458753, 0, 0, -524288, 0, 0, -524287, 0, 0, -524286, 0, 0, -524285, 0, 0, -524284, 0, 0, -524283, 0, 0, -524282, 0, 0, -524281, 0, 0, -458751, 0, 0, -458745, 0, 0, -393215, 0, 0, -393209, 0, 0, -327679, 0, 0, -327673, 0, 0, -196616, 0, 0, -262143, 0, 0, -262137, 0, 0, -131080, 0, 0, -196607, 0, 0, -196601, 0, 0, -65544, 0, 0, -131071, 0, 0, -131065, 0, 0, -8, 0, 0, -65535, 0, 0, -65529, 0, 0, 65528, 0, 0, 1, 0, 0, 131064, 0, 0, 196600, 0, 0, 262136, 0, 0, 196615, 0, 0, 327672, 0, 0, 262151, 0, 0, 393208, 0, 0, 327687, 0, 0, 458744, 0, 0, 393223, 0, 0, 524280, 0, 0, 524281, 0, 0, 524282, 0, 0, 524283, 0, 0, 524284, 0, 0, 524285, 0, 0, 458753, 0, 0, 458754, 0, 0, 458755, 0, 0, 458756, 0, 0, 458757, 0, 0, 458758, 0, 0, 458759, 0, 0 )

[node name="Portal1" type="Area2D" parent="TileMap"]
editor/display_folded = true
position = Vector2( -8, 112 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="TileMap/Portal1"]
position = Vector2( 0, 16 )
shape = SubResource( 4 )

[node name="Portal2" type="Area2D" parent="TileMap"]
editor/display_folded = true
position = Vector2( 112, 24 )
rotation = -1.57079

[node name="CollisionShape2D" type="CollisionShape2D" parent="TileMap/Portal2"]
position = Vector2( 3.05176e-005, 16 )
shape = SubResource( 4 )

[node name="Hazard" parent="TileMap" instance=ExtResource( 4 )]
position = Vector2( 8, 8 )
rotation = -1.57079

[node name="Hazard2" parent="TileMap" instance=ExtResource( 4 )]
position = Vector2( -104, 8 )
rotation = -1.57079

[node name="Hazard3" parent="TileMap" instance=ExtResource( 4 )]
position = Vector2( -88, 8 )
rotation = -1.57079

[node name="Hazard4" parent="TileMap" instance=ExtResource( 4 )]
position = Vector2( -72, 8 )
rotation = -1.57079

[node name="Hazard5" parent="TileMap" instance=ExtResource( 4 )]
position = Vector2( -56, 8 )
rotation = -1.57079

[node name="Gate" parent="TileMap" instance=ExtResource( 5 )]
position = Vector2( -120, -88 )

[node name="Player" type="KinematicBody2D" parent="."]
position = Vector2( 88, 184 )
__meta__ = {
"_edit_group_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="Player"]
shape = SubResource( 5 )

[node name="Sprite" type="Sprite" parent="Player"]
texture = ExtResource( 6 )
[connection signal="body_entered" from="TileMap/Portal1" to="." method="_on_Portal1_body_entered"]
[connection signal="body_entered" from="TileMap/Portal2" to="." method="_on_Portal2_body_entered"]
   GDST              M   PNG �PNG

   IHDR         ��h6   IDAT(�c`�`�   {��    IEND�B`�       [remap]

importer="texture"
type="StreamTexture"
path="res://.import/black.png-19a8df0b1a4edb74ea2eecb66d46d03d.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://black.png"
dest_files=[ "res://.import/black.png-19a8df0b1a4edb74ea2eecb66d46d03d.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
             [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST   0           b   PNG �PNG

   IHDR      0   �=m    %IDATH�c����$�D��Q�F5�j�0�aTè��� �^)ґ�    IEND�B`�  [remap]

importer="texture"
type="StreamTexture"
path="res://.import/gate.png-a12930027a89789f88c7372eae9b4450.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://gate.png"
dest_files=[ "res://.import/gate.png-a12930027a89789f88c7372eae9b4450.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
GDST               Y   PNG �PNG

   IHDR         ��h6   IDAT(�c������?р�x��F55 Os-�o4    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/hazard.png-70c5ddec35e8598a6a92b8952b430991.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://hazard.png"
dest_files=[ "res://.import/hazard.png-70c5ddec35e8598a6a92b8952b430991.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
        GDST@   @           |  PNG �PNG

   IHDR   @   @   �iq�  ?IDATx��{pTU�����;�N7	�����%"fyN�8��r\]fEgةf���X�g��F�Y@Wp\]|,�D@��	$$���	��I�n���ҝt����JW�s��}�=���|�D(���W@T0^����f��	��q!��!i��7�C���V�P4}! ���t�ŀx��dB.��x^��x�ɏN��贚�E�2�Z�R�EP(�6�<0dYF���}^Ѡ�,	�3=�_<��(P&�
tF3j�Q���Q�B�7�3�D�@�G�U��ĠU=� �M2!*��[�ACT(�&�@0hUO�u��U�O�J��^FT(Qit �V!>%���9 J���jv	�R�@&��g���t�5S��A��R��OO^vz�u�L�2�����lM��>tH
�R6��������dk��=b�K�љ�]�י�F*W�볃�\m=�13� �Є,�ˏy��Ic��&G��k�t�M��/Q]�أ]Q^6o��r�h����Lʳpw���,�,���)��O{�:א=]� :LF�[�*���'/���^�d�Pqw�>>��k��G�g���No���\��r����/���q�̾��	�G��O���t%L�:`Ƶww�+���}��ݾ ۿ��SeŔ����  �b⾻ǰ��<n_�G��/��8�Σ�l]z/3��g����sB��tm�tjvw�:��5���l~�O���v��]ǚ��֩=�H	u���54�:�{"������}k����d���^��`�6�ev�#Q$�ήǞ��[�Ặ�e�e��Hqo{�59i˲����O+��e������4�u�r��z�q~8c
 �G���7vr��tZ5�X�7����_qQc�[����uR��?/���+d��x�>r2����P6����`�k��,7�8�ɿ��O<Ė��}AM�E%�;�SI�BF���}��@P�yK�@��_:����R{��C_���9������
M��~����i����������s���������6�,�c�������q�����`����9���W�pXW]���:�n�aұt~9�[���~e�;��f���G���v0ԣ� ݈���y�,��:j%gox�T
�����kְ�����%<��A`���Jk?���� gm���x�*o4����o��.�����逊i�L����>���-���c�����5L����i�}�����4����usB������67��}����Z�ȶ�)+����)+H#ۢ�RK�AW�xww%��5�lfC�A���bP�lf��5����>���`0ċ/oA-�,�]ĝ�$�峋P2/���`���;����[Y��.&�Y�QlM���ƌb+��,�s�[��S ��}<;���]�:��y��1>'�AMm����7q���RY%9)���ȡI�]>�_l�C����-z�� ;>�-g�dt5іT�Aͺy�2w9���d�T��J�}u�}���X�Ks���<@��t��ebL������w�aw�N����c����F���3
�2먭�e���PQ�s�`��m<1u8�3�#����XMڈe�3�yb�p�m��܇+��x�%O?CmM-Yf��(�K�h�بU1%?I�X�r��� ��n^y�U�����1�玒�6..e��RJrRz�Oc������ʫ��]9���ZV�\�$IL�OŨ��{��M�p�L56��Wy��J�R{���FDA@
��^�y�������l6���{�=��ή�V�hM�V���JK��:��\�+��@�l/���ʧ����pQ��������׷Q^^�(�T������|.���9�?I�M���>���5�f欙X�VƎ-f͚ո���9����=�m���Y���c��Z�̚5��k~���gHHR�Ls/l9²���+ ����:��杧��"9�@��ad�ŝ��ѽ�Y���]O�W_�`Ֆ#Դ8�z��5-N^�r�Z����h���ʆY���=�`�M���Ty�l���.	�/z��fH���������֗�H�9�f������G� ̛<��q��|�]>ں}�N�3�;i�r"�(2RtY���4X���F�
�����8 �[�\锰�b`�0s�:���v���2�f��k�Zp��Ω&G���=��6em.mN�o.u�fԐc��i����C���u=~{�����a^�UH������¡,�t(jy�Q�ɋ����5�Gaw��/�Kv?�|K��(��SF�h�����V��xȩ2St쯹���{6b�M/�t��@0�{�Ԫ�"�v7�Q�A�(�ľR�<	�w�H1D�|8�]�]�Ո%����jҢ꯸hs�"~꯸P�B�� �%I}}��+f�����O�cg�3rd���P�������qIڻ]�h�c9��xh )z5��� �ƾ"1:3���j���'1;��#U�失g���0I}�u3.)@�Q�A�ĠQ`I�`�(1h��t*�:�>'��&v��!I?�/.)@�S�%q�\���l�TWq�������լ�G�5zy6w��[��5�r���L`�^���/x}�>��t4���cݦ�(�H�g��C�EA�g�)�Hfݦ��5�;q-���?ư�4�����K����XQ*�av�F��������񵏷�;>��l�\F��Þs�c�hL�5�G�c�������=q�P����E �.���'��8Us�{Ǎ���#������q�HDA`b��%����F�hog���|�������]K�n��UJ�}������Dk��g��8q���&G����A�RP�e�$'�i��I3j�w8������?�G�&<	&䪬R��lb1�J����B$�9�꤮�ES���[�������8�]��I�B!
�T
L:5�����d���K30"-	�(��D5�v��#U�����jԔ�QR�GIaó�I3�nJVk���&'��q����ux��AP<�"�Q�����H�`Jң�jP(D��]�����`0��+�p�inm�r�)��,^�_�rI�,��H>?M-44���x���"� �H�T��zIty����^B�.��%9?E����П�($@H!�D��#m�e���vB(��t �2.��8!���s2Tʡ �N;>w'����dq�"�2����O�9$�P	<(��z�Ff�<�z�N��/yD�t�/?�B.��A��>��i%�ǋ"�p n� ���]~!�W�J���a�q!n��V X*�c �TJT*%�6�<d[�    IEND�B`�        [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
GDST              V   PNG �PNG

   IHDR         ��h6   IDAT(�c\n����D��Q��� ���qW    IEND�B`�              [remap]

importer="texture"
type="StreamTexture"
path="res://.import/purple.png-993a3fae7325db95475822da4ec84ea6.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://purple.png"
dest_files=[ "res://.import/purple.png-993a3fae7325db95475822da4ec84ea6.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
          GDST              V   PNG �PNG

   IHDR         ��h6   IDAT(�c���?)��$գF5) Um�FZ    IEND�B`�              [remap]

importer="texture"
type="StreamTexture"
path="res://.import/white.png-d8533361663a5f8fe5200e5b5262a62d.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://white.png"
dest_files=[ "res://.import/white.png-d8533361663a5f8fe5200e5b5262a62d.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
             [remap]

path="res://Area2D.gdc"
               [remap]

path="res://Gate.gdc"
 [remap]

path="res://Hazard.gdc"
               [remap]

path="res://Scene.gdc"
�PNG

   IHDR   @   @   �iq�  0IDATx��}pTU����L����W�$�@HA�%"fa��Yw�)��A��Egةf���X�g˱��tQ���Eq�!�|K�@BHH:�t>�;�����1!ݝn�A�_UWw����{λ��sϽO�q汤��X,�q�z�<�q{cG.;��]�_�`9s��|o���:��1�E�V� ~=�	��ݮ����g[N�u�5$M��NI��-
�"(U*��@��"oqdYF�y�x�N�e�2���s����KҦ`L��Z)=,�Z}"
�A�n{�A@%$��R���F@�$m������[��H���"�VoD��v����Kw�d��v	�D�$>	�J��;�<�()P�� �F��
�< �R����&�կ��� ����������%�u̚VLNfڠus2�̚VL�~�>���mOMJ���J'R��������X����׬X�Ϲ虾��6Pq������j���S?�1@gL���±����(�2A�l��h��õm��Nb�l_�U���+����_����p�)9&&e)�0 �2{��������1���@LG�A��+���d�W|x�2-����Fk7�2x��y,_�_��}z��rzy��%n�-]l����L��;
�s���:��1�sL0�ڳ���X����m_]���BJ��im�  �d��I��Pq���N'�����lYz7�����}1�sL��v�UIX���<��Ó3���}���nvk)[����+bj�[���k�������cݮ��4t:= $h�4w:qz|A��٧�XSt�zn{�&��õmQ���+�^�j�*��S��e���o�V,	��q=Y�)hԪ��F5~����h�4 *�T�o��R���z�o)��W�]�Sm銺#�Qm�]�c�����v��JO��?D��B v|z�կ��܈�'�z6?[� ���p�X<-���o%�32����Ρz�>��5�BYX2���ʦ�b��>ǣ������SI,�6���|���iXYQ���U�҅e�9ma��:d`�iO����{��|��~����!+��Ϧ�u�n��7���t>�l捊Z�7�nвta�Z���Ae:��F���g�.~����_y^���K�5��.2�Zt*�{ܔ���G��6�Y����|%�M	���NPV.]��P���3�8g���COTy�� ����AP({�>�"/��g�0��<^��K���V����ϫ�zG�3K��k���t����)�������6���a�5��62Mq����oeJ�R�4�q�%|�� ������z���ä�>���0�T,��ǩ�����"lݰ���<��fT����IrX>� � ��K��q�}4���ʋo�dJ��م�X�sؘ]hfJ�����Ŧ�A�Gm߽�g����YG��X0u$�Y�u*jZl|p������*�Jd~qcR�����λ�.�
�r�4���zپ;��AD�eЪU��R�:��I���@�.��&3}l
o�坃7��ZX��O�� 2v����3��O���j�t	�W�0�n5����#è����%?}����`9۶n���7"!�uf��A�l܈�>��[�2��r��b�O�������gg�E��PyX�Q2-7���ʕ������p��+���~f��;����T	�*�(+q@���f��ϫ����ѓ���a��U�\.��&��}�=dd'�p�l�e@y��
r�����zDA@����9�:��8�Y,�����=�l�֮��F|kM�R��GJK��*�V_k+��P�,N.�9��K~~~�HYY��O��k���Q�����|rss�����1��ILN��~�YDV��-s�lfB֬Y�#.�=�>���G\k֬fB�f3��?��k~���f�IR�lS'�m>²9y���+ �v��y��M;NlF���A���w���w�b���Л�j�d��#T��b���e��[l<��(Z�D�NMC���k|Zi�������Ɗl��@�1��v��Щ�!曣�n��S������<@̠7�w�4X�D<A`�ԑ�ML����jw���c��8��ES��X��������ƤS�~�׾�%n�@��( Zm\�raҩ���x��_���n�n���2&d(�6�,8^o�TcG���3���emv7m6g.w��W�e
�h���|��Wy��~���̽�!c� �ݟO�)|�6#?�%�,O֫9y������w��{r�2e��7Dl �ׇB�2�@���ĬD4J)�&�$
�HԲ��
/�߹�m��<JF'!�>���S��PJ"V5!�A�(��F>SD�ۻ�$�B/>lΞ�.Ϭ�?p�l6h�D��+v�l�+v$Q�B0ūz����aԩh�|9�p����cƄ,��=Z�����������Dc��,P��� $ƩЩ�]��o+�F$p�|uM���8R��L�0�@e'���M�]^��jt*:��)^�N�@�V`�*�js�up��X�n���tt{�t:�����\�]>�n/W�\|q.x��0���D-���T��7G5jzi���[��4�r���Ij������p�=a�G�5���ͺ��S���/��#�B�EA�s�)HO`���U�/QM���cdz
�,�!�(���g�m+<R��?�-`�4^}�#>�<��mp��Op{�,[<��iz^�s�cü-�;���쾱d����xk瞨eH)��x@���h�ɪZNU_��cxx�hƤ�cwzi�p]��Q��cbɽcx��t�����M|�����x�=S�N���
Ͽ�Ee3HL�����gg,���NecG�S_ѠQJf(�Jd�4R�j��6�|�6��s<Q��N0&Ge
��Ʌ��,ᮢ$I�痹�j���Nc���'�N�n�=>|~�G��2�)�D�R U���&ՠ!#1���S�D��Ǘ'��ೃT��E�7��F��(?�����s��F��pC�Z�:�m�p�l-'�j9QU��:��a3@0�*%�#�)&�q�i�H��1�'��vv���q8]t�4����j��t-}IـxY�����C}c��-�"?Z�o�8�4Ⱦ���J]/�v�g���Cȷ2]�.�Ǣ ��Ս�{0
�>/^W7�_�����mV铲�
i���FR��$>��}^��dُ�۵�����%��*C�'�x�d9��v�ߏ � ���ۣ�Wg=N�n�~������/�}�_��M��[���uR�N���(E�	� ������z��~���.m9w����c����
�?���{�    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name      	   rubix_new      application/run/main_scene         res://Scene.tscn   application/config/icon         res://icon.png     display/window/size/width            display/window/size/height            display/window/size/test_width      X     display/window/size/test_height      X     display/window/stretch/mode         2d     display/window/stretch/aspect         expand     input/ui_accept�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script               InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script               InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          unicode           echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index          pressure          pressed           script               InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      unicode           echo          script               InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script            input/ui_left\              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script               InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      unicode           echo          script            input/ui_right\              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script               InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      unicode           echo          script            input/qd              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   Q      unicode           echo          script            input/ed              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   E      unicode           echo          script         $   rendering/quality/driver/driver_name         GLES2   %   rendering/vram_compression/import_etc         &   rendering/vram_compression/import_etc2          )   rendering/environment/default_environment          res://default_env.tres          GDPC