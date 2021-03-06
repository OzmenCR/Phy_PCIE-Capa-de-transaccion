/* Generated by Yosys 0.7 (git sha1 61f6811, gcc 4.8.4-2ubuntu1~14.04.3 -O2 -fstack-protector -fPIC -Os) */

(* top =  1  *)
(* src = "un_byte_stripingS.v:1" *)
module un_byte_stripingS(data_out, reset_L, lane_0, lane_1, valid_0, valid_1, valid_out, clk_2f, clk_f);
  (* src = "un_byte_stripingS.v:19" *)
  wire [31:0] _000_;
  (* src = "un_byte_stripingS.v:19" *)
  wire _001_;
  (* src = "un_byte_stripingS.v:19" *)
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  (* src = "un_byte_stripingS.v:9" *)
  input clk_2f;
  (* src = "un_byte_stripingS.v:10" *)
  input clk_f;
  (* src = "un_byte_stripingS.v:2" *)
  output [31:0] data_out;
  (* src = "un_byte_stripingS.v:4" *)
  input [31:0] lane_0;
  (* src = "un_byte_stripingS.v:5" *)
  input [31:0] lane_1;
  (* src = "un_byte_stripingS.v:3" *)
  input reset_L;
  (* src = "un_byte_stripingS.v:11" *)
  wire selector;
  (* src = "un_byte_stripingS.v:6" *)
  input valid_0;
  (* src = "un_byte_stripingS.v:7" *)
  input valid_1;
  (* src = "un_byte_stripingS.v:8" *)
  output valid_out;
  NOR _134_ (
    .A(lane_0[0]),
    .B(selector),
    .Y(_003_)
  );
  NOT _135_ (
    .A(lane_1[0]),
    .Y(_004_)
  );
  NAND _136_ (
    .A(_004_),
    .B(selector),
    .Y(_005_)
  );
  NAND _137_ (
    .A(_005_),
    .B(valid_0),
    .Y(_006_)
  );
  NOR _138_ (
    .A(_006_),
    .B(_003_),
    .Y(_000_[0])
  );
  NOR _139_ (
    .A(lane_0[1]),
    .B(selector),
    .Y(_007_)
  );
  NOT _140_ (
    .A(lane_1[1]),
    .Y(_008_)
  );
  NAND _141_ (
    .A(_008_),
    .B(selector),
    .Y(_009_)
  );
  NAND _142_ (
    .A(_009_),
    .B(valid_0),
    .Y(_010_)
  );
  NOR _143_ (
    .A(_010_),
    .B(_007_),
    .Y(_000_[1])
  );
  NOR _144_ (
    .A(lane_0[2]),
    .B(selector),
    .Y(_011_)
  );
  NOT _145_ (
    .A(lane_1[2]),
    .Y(_012_)
  );
  NAND _146_ (
    .A(_012_),
    .B(selector),
    .Y(_013_)
  );
  NAND _147_ (
    .A(_013_),
    .B(valid_0),
    .Y(_014_)
  );
  NOR _148_ (
    .A(_014_),
    .B(_011_),
    .Y(_000_[2])
  );
  NOR _149_ (
    .A(lane_0[3]),
    .B(selector),
    .Y(_015_)
  );
  NOT _150_ (
    .A(lane_1[3]),
    .Y(_016_)
  );
  NAND _151_ (
    .A(_016_),
    .B(selector),
    .Y(_017_)
  );
  NAND _152_ (
    .A(_017_),
    .B(valid_0),
    .Y(_018_)
  );
  NOR _153_ (
    .A(_018_),
    .B(_015_),
    .Y(_000_[3])
  );
  NOR _154_ (
    .A(lane_0[4]),
    .B(selector),
    .Y(_019_)
  );
  NOT _155_ (
    .A(lane_1[4]),
    .Y(_020_)
  );
  NAND _156_ (
    .A(_020_),
    .B(selector),
    .Y(_021_)
  );
  NAND _157_ (
    .A(_021_),
    .B(valid_0),
    .Y(_022_)
  );
  NOR _158_ (
    .A(_022_),
    .B(_019_),
    .Y(_000_[4])
  );
  NOR _159_ (
    .A(lane_0[5]),
    .B(selector),
    .Y(_023_)
  );
  NOT _160_ (
    .A(lane_1[5]),
    .Y(_024_)
  );
  NAND _161_ (
    .A(_024_),
    .B(selector),
    .Y(_025_)
  );
  NAND _162_ (
    .A(_025_),
    .B(valid_0),
    .Y(_026_)
  );
  NOR _163_ (
    .A(_026_),
    .B(_023_),
    .Y(_000_[5])
  );
  NOR _164_ (
    .A(lane_0[6]),
    .B(selector),
    .Y(_027_)
  );
  NOT _165_ (
    .A(lane_1[6]),
    .Y(_028_)
  );
  NAND _166_ (
    .A(_028_),
    .B(selector),
    .Y(_029_)
  );
  NAND _167_ (
    .A(_029_),
    .B(valid_0),
    .Y(_030_)
  );
  NOR _168_ (
    .A(_030_),
    .B(_027_),
    .Y(_000_[6])
  );
  NOR _169_ (
    .A(lane_0[7]),
    .B(selector),
    .Y(_031_)
  );
  NOT _170_ (
    .A(lane_1[7]),
    .Y(_032_)
  );
  NAND _171_ (
    .A(_032_),
    .B(selector),
    .Y(_033_)
  );
  NAND _172_ (
    .A(_033_),
    .B(valid_0),
    .Y(_034_)
  );
  NOR _173_ (
    .A(_034_),
    .B(_031_),
    .Y(_000_[7])
  );
  NOR _174_ (
    .A(lane_0[8]),
    .B(selector),
    .Y(_035_)
  );
  NOT _175_ (
    .A(lane_1[8]),
    .Y(_036_)
  );
  NAND _176_ (
    .A(_036_),
    .B(selector),
    .Y(_037_)
  );
  NAND _177_ (
    .A(_037_),
    .B(valid_0),
    .Y(_038_)
  );
  NOR _178_ (
    .A(_038_),
    .B(_035_),
    .Y(_000_[8])
  );
  NOR _179_ (
    .A(lane_0[9]),
    .B(selector),
    .Y(_039_)
  );
  NOT _180_ (
    .A(lane_1[9]),
    .Y(_040_)
  );
  NAND _181_ (
    .A(_040_),
    .B(selector),
    .Y(_041_)
  );
  NAND _182_ (
    .A(_041_),
    .B(valid_0),
    .Y(_042_)
  );
  NOR _183_ (
    .A(_042_),
    .B(_039_),
    .Y(_000_[9])
  );
  NOR _184_ (
    .A(lane_0[10]),
    .B(selector),
    .Y(_043_)
  );
  NOT _185_ (
    .A(lane_1[10]),
    .Y(_044_)
  );
  NAND _186_ (
    .A(_044_),
    .B(selector),
    .Y(_045_)
  );
  NAND _187_ (
    .A(_045_),
    .B(valid_0),
    .Y(_046_)
  );
  NOR _188_ (
    .A(_046_),
    .B(_043_),
    .Y(_000_[10])
  );
  NOR _189_ (
    .A(lane_0[11]),
    .B(selector),
    .Y(_047_)
  );
  NOT _190_ (
    .A(lane_1[11]),
    .Y(_048_)
  );
  NAND _191_ (
    .A(_048_),
    .B(selector),
    .Y(_049_)
  );
  NAND _192_ (
    .A(_049_),
    .B(valid_0),
    .Y(_050_)
  );
  NOR _193_ (
    .A(_050_),
    .B(_047_),
    .Y(_000_[11])
  );
  NOR _194_ (
    .A(lane_0[12]),
    .B(selector),
    .Y(_051_)
  );
  NOT _195_ (
    .A(lane_1[12]),
    .Y(_052_)
  );
  NAND _196_ (
    .A(_052_),
    .B(selector),
    .Y(_053_)
  );
  NAND _197_ (
    .A(_053_),
    .B(valid_0),
    .Y(_054_)
  );
  NOR _198_ (
    .A(_054_),
    .B(_051_),
    .Y(_000_[12])
  );
  NOR _199_ (
    .A(lane_0[13]),
    .B(selector),
    .Y(_055_)
  );
  NOT _200_ (
    .A(lane_1[13]),
    .Y(_056_)
  );
  NAND _201_ (
    .A(_056_),
    .B(selector),
    .Y(_057_)
  );
  NAND _202_ (
    .A(_057_),
    .B(valid_0),
    .Y(_058_)
  );
  NOR _203_ (
    .A(_058_),
    .B(_055_),
    .Y(_000_[13])
  );
  NOR _204_ (
    .A(lane_0[14]),
    .B(selector),
    .Y(_059_)
  );
  NOT _205_ (
    .A(lane_1[14]),
    .Y(_060_)
  );
  NAND _206_ (
    .A(_060_),
    .B(selector),
    .Y(_061_)
  );
  NAND _207_ (
    .A(_061_),
    .B(valid_0),
    .Y(_062_)
  );
  NOR _208_ (
    .A(_062_),
    .B(_059_),
    .Y(_000_[14])
  );
  NOR _209_ (
    .A(lane_0[15]),
    .B(selector),
    .Y(_063_)
  );
  NOT _210_ (
    .A(lane_1[15]),
    .Y(_064_)
  );
  NAND _211_ (
    .A(_064_),
    .B(selector),
    .Y(_065_)
  );
  NAND _212_ (
    .A(_065_),
    .B(valid_0),
    .Y(_066_)
  );
  NOR _213_ (
    .A(_066_),
    .B(_063_),
    .Y(_000_[15])
  );
  NOR _214_ (
    .A(lane_0[16]),
    .B(selector),
    .Y(_067_)
  );
  NOT _215_ (
    .A(lane_1[16]),
    .Y(_068_)
  );
  NAND _216_ (
    .A(_068_),
    .B(selector),
    .Y(_069_)
  );
  NAND _217_ (
    .A(_069_),
    .B(valid_0),
    .Y(_070_)
  );
  NOR _218_ (
    .A(_070_),
    .B(_067_),
    .Y(_000_[16])
  );
  NOR _219_ (
    .A(lane_0[17]),
    .B(selector),
    .Y(_071_)
  );
  NOT _220_ (
    .A(lane_1[17]),
    .Y(_072_)
  );
  NAND _221_ (
    .A(_072_),
    .B(selector),
    .Y(_073_)
  );
  NAND _222_ (
    .A(_073_),
    .B(valid_0),
    .Y(_074_)
  );
  NOR _223_ (
    .A(_074_),
    .B(_071_),
    .Y(_000_[17])
  );
  NOR _224_ (
    .A(lane_0[18]),
    .B(selector),
    .Y(_075_)
  );
  NOT _225_ (
    .A(lane_1[18]),
    .Y(_076_)
  );
  NAND _226_ (
    .A(_076_),
    .B(selector),
    .Y(_077_)
  );
  NAND _227_ (
    .A(_077_),
    .B(valid_0),
    .Y(_078_)
  );
  NOR _228_ (
    .A(_078_),
    .B(_075_),
    .Y(_000_[18])
  );
  NOR _229_ (
    .A(lane_0[19]),
    .B(selector),
    .Y(_079_)
  );
  NOT _230_ (
    .A(lane_1[19]),
    .Y(_080_)
  );
  NAND _231_ (
    .A(_080_),
    .B(selector),
    .Y(_081_)
  );
  NAND _232_ (
    .A(_081_),
    .B(valid_0),
    .Y(_082_)
  );
  NOR _233_ (
    .A(_082_),
    .B(_079_),
    .Y(_000_[19])
  );
  NOR _234_ (
    .A(lane_0[20]),
    .B(selector),
    .Y(_083_)
  );
  NOT _235_ (
    .A(lane_1[20]),
    .Y(_084_)
  );
  NAND _236_ (
    .A(_084_),
    .B(selector),
    .Y(_085_)
  );
  NAND _237_ (
    .A(_085_),
    .B(valid_0),
    .Y(_086_)
  );
  NOR _238_ (
    .A(_086_),
    .B(_083_),
    .Y(_000_[20])
  );
  NOR _239_ (
    .A(lane_0[21]),
    .B(selector),
    .Y(_087_)
  );
  NOT _240_ (
    .A(lane_1[21]),
    .Y(_088_)
  );
  NAND _241_ (
    .A(_088_),
    .B(selector),
    .Y(_089_)
  );
  NAND _242_ (
    .A(_089_),
    .B(valid_0),
    .Y(_090_)
  );
  NOR _243_ (
    .A(_090_),
    .B(_087_),
    .Y(_000_[21])
  );
  NOR _244_ (
    .A(lane_0[22]),
    .B(selector),
    .Y(_091_)
  );
  NOT _245_ (
    .A(lane_1[22]),
    .Y(_092_)
  );
  NAND _246_ (
    .A(_092_),
    .B(selector),
    .Y(_093_)
  );
  NAND _247_ (
    .A(_093_),
    .B(valid_0),
    .Y(_094_)
  );
  NOR _248_ (
    .A(_094_),
    .B(_091_),
    .Y(_000_[22])
  );
  NOR _249_ (
    .A(lane_0[23]),
    .B(selector),
    .Y(_095_)
  );
  NOT _250_ (
    .A(lane_1[23]),
    .Y(_096_)
  );
  NAND _251_ (
    .A(_096_),
    .B(selector),
    .Y(_097_)
  );
  NAND _252_ (
    .A(_097_),
    .B(valid_0),
    .Y(_098_)
  );
  NOR _253_ (
    .A(_098_),
    .B(_095_),
    .Y(_000_[23])
  );
  NOR _254_ (
    .A(lane_0[24]),
    .B(selector),
    .Y(_099_)
  );
  NOT _255_ (
    .A(lane_1[24]),
    .Y(_100_)
  );
  NAND _256_ (
    .A(_100_),
    .B(selector),
    .Y(_101_)
  );
  NAND _257_ (
    .A(_101_),
    .B(valid_0),
    .Y(_102_)
  );
  NOR _258_ (
    .A(_102_),
    .B(_099_),
    .Y(_000_[24])
  );
  NOR _259_ (
    .A(lane_0[25]),
    .B(selector),
    .Y(_103_)
  );
  NOT _260_ (
    .A(lane_1[25]),
    .Y(_104_)
  );
  NAND _261_ (
    .A(_104_),
    .B(selector),
    .Y(_105_)
  );
  NAND _262_ (
    .A(_105_),
    .B(valid_0),
    .Y(_106_)
  );
  NOR _263_ (
    .A(_106_),
    .B(_103_),
    .Y(_000_[25])
  );
  NOR _264_ (
    .A(lane_0[26]),
    .B(selector),
    .Y(_107_)
  );
  NOT _265_ (
    .A(lane_1[26]),
    .Y(_108_)
  );
  NAND _266_ (
    .A(_108_),
    .B(selector),
    .Y(_109_)
  );
  NAND _267_ (
    .A(_109_),
    .B(valid_0),
    .Y(_110_)
  );
  NOR _268_ (
    .A(_110_),
    .B(_107_),
    .Y(_000_[26])
  );
  NOR _269_ (
    .A(lane_0[27]),
    .B(selector),
    .Y(_111_)
  );
  NOT _270_ (
    .A(lane_1[27]),
    .Y(_112_)
  );
  NAND _271_ (
    .A(_112_),
    .B(selector),
    .Y(_113_)
  );
  NAND _272_ (
    .A(_113_),
    .B(valid_0),
    .Y(_114_)
  );
  NOR _273_ (
    .A(_114_),
    .B(_111_),
    .Y(_000_[27])
  );
  NOR _274_ (
    .A(lane_0[28]),
    .B(selector),
    .Y(_115_)
  );
  NOT _275_ (
    .A(lane_1[28]),
    .Y(_116_)
  );
  NAND _276_ (
    .A(_116_),
    .B(selector),
    .Y(_117_)
  );
  NAND _277_ (
    .A(_117_),
    .B(valid_0),
    .Y(_118_)
  );
  NOR _278_ (
    .A(_118_),
    .B(_115_),
    .Y(_000_[28])
  );
  NOR _279_ (
    .A(selector),
    .B(lane_0[29]),
    .Y(_119_)
  );
  NOT _280_ (
    .A(lane_1[29]),
    .Y(_120_)
  );
  NAND _281_ (
    .A(selector),
    .B(_120_),
    .Y(_121_)
  );
  NAND _282_ (
    .A(_121_),
    .B(valid_0),
    .Y(_122_)
  );
  NOR _283_ (
    .A(_122_),
    .B(_119_),
    .Y(_000_[29])
  );
  NOR _284_ (
    .A(lane_0[30]),
    .B(selector),
    .Y(_123_)
  );
  NOT _285_ (
    .A(lane_1[30]),
    .Y(_124_)
  );
  NAND _286_ (
    .A(_124_),
    .B(selector),
    .Y(_125_)
  );
  NAND _287_ (
    .A(_125_),
    .B(valid_0),
    .Y(_126_)
  );
  NOR _288_ (
    .A(_126_),
    .B(_123_),
    .Y(_000_[30])
  );
  NOR _289_ (
    .A(lane_0[31]),
    .B(selector),
    .Y(_127_)
  );
  NOT _290_ (
    .A(lane_1[31]),
    .Y(_128_)
  );
  NAND _291_ (
    .A(_128_),
    .B(selector),
    .Y(_129_)
  );
  NAND _292_ (
    .A(_129_),
    .B(valid_0),
    .Y(_130_)
  );
  NOR _293_ (
    .A(_130_),
    .B(_127_),
    .Y(_000_[31])
  );
  NOT _294_ (
    .A(valid_0),
    .Y(_131_)
  );
  NOR _295_ (
    .A(_131_),
    .B(selector),
    .Y(_001_)
  );
  NOT _296_ (
    .A(selector),
    .Y(_132_)
  );
  NOR _297_ (
    .A(valid_1),
    .B(_132_),
    .Y(_133_)
  );
  NOR _298_ (
    .A(_133_),
    .B(_131_),
    .Y(_002_)
  );
  DFF _299_ (
    .C(clk_2f),
    .D(_000_[0]),
    .Q(data_out[0])
  );
  DFF _300_ (
    .C(clk_2f),
    .D(_000_[1]),
    .Q(data_out[1])
  );
  DFF _301_ (
    .C(clk_2f),
    .D(_000_[2]),
    .Q(data_out[2])
  );
  DFF _302_ (
    .C(clk_2f),
    .D(_000_[3]),
    .Q(data_out[3])
  );
  DFF _303_ (
    .C(clk_2f),
    .D(_000_[4]),
    .Q(data_out[4])
  );
  DFF _304_ (
    .C(clk_2f),
    .D(_000_[5]),
    .Q(data_out[5])
  );
  DFF _305_ (
    .C(clk_2f),
    .D(_000_[6]),
    .Q(data_out[6])
  );
  DFF _306_ (
    .C(clk_2f),
    .D(_000_[7]),
    .Q(data_out[7])
  );
  DFF _307_ (
    .C(clk_2f),
    .D(_000_[8]),
    .Q(data_out[8])
  );
  DFF _308_ (
    .C(clk_2f),
    .D(_000_[9]),
    .Q(data_out[9])
  );
  DFF _309_ (
    .C(clk_2f),
    .D(_000_[10]),
    .Q(data_out[10])
  );
  DFF _310_ (
    .C(clk_2f),
    .D(_000_[11]),
    .Q(data_out[11])
  );
  DFF _311_ (
    .C(clk_2f),
    .D(_000_[12]),
    .Q(data_out[12])
  );
  DFF _312_ (
    .C(clk_2f),
    .D(_000_[13]),
    .Q(data_out[13])
  );
  DFF _313_ (
    .C(clk_2f),
    .D(_000_[14]),
    .Q(data_out[14])
  );
  DFF _314_ (
    .C(clk_2f),
    .D(_000_[15]),
    .Q(data_out[15])
  );
  DFF _315_ (
    .C(clk_2f),
    .D(_000_[16]),
    .Q(data_out[16])
  );
  DFF _316_ (
    .C(clk_2f),
    .D(_000_[17]),
    .Q(data_out[17])
  );
  DFF _317_ (
    .C(clk_2f),
    .D(_000_[18]),
    .Q(data_out[18])
  );
  DFF _318_ (
    .C(clk_2f),
    .D(_000_[19]),
    .Q(data_out[19])
  );
  DFF _319_ (
    .C(clk_2f),
    .D(_000_[20]),
    .Q(data_out[20])
  );
  DFF _320_ (
    .C(clk_2f),
    .D(_000_[21]),
    .Q(data_out[21])
  );
  DFF _321_ (
    .C(clk_2f),
    .D(_000_[22]),
    .Q(data_out[22])
  );
  DFF _322_ (
    .C(clk_2f),
    .D(_000_[23]),
    .Q(data_out[23])
  );
  DFF _323_ (
    .C(clk_2f),
    .D(_000_[24]),
    .Q(data_out[24])
  );
  DFF _324_ (
    .C(clk_2f),
    .D(_000_[25]),
    .Q(data_out[25])
  );
  DFF _325_ (
    .C(clk_2f),
    .D(_000_[26]),
    .Q(data_out[26])
  );
  DFF _326_ (
    .C(clk_2f),
    .D(_000_[27]),
    .Q(data_out[27])
  );
  DFF _327_ (
    .C(clk_2f),
    .D(_000_[28]),
    .Q(data_out[28])
  );
  DFF _328_ (
    .C(clk_2f),
    .D(_000_[29]),
    .Q(data_out[29])
  );
  DFF _329_ (
    .C(clk_2f),
    .D(_000_[30]),
    .Q(data_out[30])
  );
  DFF _330_ (
    .C(clk_2f),
    .D(_000_[31]),
    .Q(data_out[31])
  );
  DFF _331_ (
    .C(clk_2f),
    .D(_002_),
    .Q(valid_out)
  );
  DFF _332_ (
    .C(clk_2f),
    .D(_001_),
    .Q(selector)
  );
endmodule
