Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AEA468C14
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248450; cv=none; b=uxtYH5WUXVzBIWcSyzak9j4s9LUN+Y1EHSrmzuTXThF/RlzZn9eNxln7BIjOu8aIt4T9JRNfC+JKE9TBujP6kQy8SP71fJ0VaEUqBitu0hBvX+s/nlg7z6UIpzVMvfGzcg+PFisxjJmMbTGYwvVreH1zlFO6G8n6lijCDB23w94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248450; c=relaxed/simple;
	bh=v7MWIqfZGj0yHDCscd2nMkMidCP3VrHdRkNj3te5k4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kU3GOIBlszfvkm3fDzGlHi8OZQF0qeI3oxeWG0MDttGGbu1tcH6IrbXZM+ZMU+QVJpZvQ8ymQhJG8tiq4TKuQHIW1SUzZZnv3D/K2wRj8rxVcA/KtHETAShR7fRS/vDXmdVJU8V3Qy4IHSY0mnhSCuMQNPs3Yv9RaAcu56nNgIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCjRr2Ht; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yd1CY338; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCjRr2Ht";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yd1CY338"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681792CD705426
	for <linux-media@vger.kernel.org>; Tue, 1 Sep 2026 07:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QX8sc1P0bS5z/s1DFAa4RJ5nBk8cITbsWxAeNOYvxes=; b=NCjRr2Ht2hmMakG9
	pUTWfAgZBzZPKAV6MD0Je/UeXkNRvqFPnMAhrdVUtMDLbSB/JmL1uU+I4HpNCLOs
	nAGlPpFg8V+6pVziOLeD7NUBzp+G8bZkbcnSil/SZNXhznXc0otgCSG5k82eZh7c
	VOlgENEg/zkrImOkeTRuBk2Ynh44X46Bs9XJdVWOD+NJZJftWA4+6c8ODTlBCBDm
	onb+mOZ7ZAzoKVEV3AtmyQ0xAnlkaTFif2/ZgFdyvxTDHHNtHa9mFRVcOzoT0db5
	X5KATV3aLjvrBdzYEn3oxdoXcqsx9iGApB8UtUD3/VIUGd6R6FD2RWGcMy+w+MVg
	N8KySw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsgjmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 07:40:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e62e3459fso604645785a.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 00:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788248446; x=1788853246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QX8sc1P0bS5z/s1DFAa4RJ5nBk8cITbsWxAeNOYvxes=;
        b=Yd1CY338klY41Tb02G9ciWf1Z2LRNW5xjBldatgitszysvogx9EmdkQTRwTWl8FHF5
         ptwemFMWlTlV6cBqHZbDvuxvAQW65dkD4HE92uzJjuITPnf9q/Zf9XyDr1WdJabF2KId
         Sy9Sf4u3u+MLOum94lqQMFmJ6Vvy7crlUb1kqsPUz4A4CSXN8Cn7NNjbTLlbcCJjV43I
         FHHQZjelYdYFlezIEraaIOtG5ckvrch3zjgQtELIzLT0XWZo6PM2sQNrjFBOU84gJB1n
         f6k+Iv2TYqmxhSRtHFUrwnKqUGs40XdYNdikG9nDhIqRyR7qRAzXriY1RFI8r0x5/BeG
         wQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248446; x=1788853246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QX8sc1P0bS5z/s1DFAa4RJ5nBk8cITbsWxAeNOYvxes=;
        b=FaYKxAtNW1Yrt/uiYjh3mm5Bw8AXj18E6Yu/GTXTibYRGOM+xswulqHOTVE67Dlz84
         He8qm2eWc9KyCdzLXmTKyBz204aluo237cSSvq6AK/Vaw10cEQpBo1Mn5bYmuGIuVp3B
         33SpyETDkmXD8W/0TY79x/32J+U9sZ7cAdseHMOJ1jVnTrFDo+jLwmWZ398plZ5p65HG
         Aia727RJlDLdKVi+I6onDVcXWg/AMmC1057ediXYA5YXWa3NYdNWFAxyP0uE803PzDYb
         PTpm9Vl+xq5BVoIYAaejm0SWn9gt4Gxmqwo7F+xUei6fJYDQpDsyNJ42+OS8sOOfAIx5
         Y+UA==
X-Gm-Message-State: AFuF++k0eLeXhaGG8kVvpNJ3enYEqeiKwmhfBJG2p2nmTdlNGbcApyUu
	I6qql8akqWqQLCkW17Pfq5dUU+ELHn8snGd2ZSQTFnXzX/St908sNd9emeoacYyBpf50iVduY5G
	VhIemMAfsMcJ3bNxgXJPl7xm39Ha858N6YDMVDGJCWkxRRKjR6OP4exn+OFVUn6BBeQ==
X-Gm-Gg: AR+sD12KYXUpACPiog2fn41LnN42fZcPxkb+jJHXOqY5/7zL01cdK8I4dquI1HbysuO
	4XydmvNK2xAxF6QYKhO8gV06dXeFL08zGuoOY8tJxMv8cTLLzVTnbYIO6UVQrFFTg4RqC/tNTBN
	eAnbGMLdqKZGF52NztTOFraG0tXuQTx2OxI4SGwWNZcydVRq5kD1Ar5P7roDlTo0rdtAqPdNan2
	hH6/t6l3iPMPghB2r4jwcR+jngpnUAN9ICWzID/gUg+byqMNXVjkXihGdRhkG2k1rB6XrDVx3ns
	83ETCIK41H2wBjqN5XN6VX1G+CQFTZP4NfyfXES68zVxhZT8qbXoR8ZQTCKuvArBPdZJDDZqWSn
	LdGB2BqAYYnwkYpr6/F3UU07Adj5IIPnXKeni5YIx+x4insmJ9QUNQ4WxHqwc/CPuu7OL
X-Received: by 2002:a05:620a:6988:b0:939:1c6:38ef with SMTP id af79cd13be357-9391374de9fmr3640373585a.6.1788248445980;
        Tue, 01 Sep 2026 00:40:45 -0700 (PDT)
X-Received: by 2002:a05:620a:6988:b0:939:1c6:38ef with SMTP id af79cd13be357-9391374de9fmr3640358785a.6.1788248444279;
        Tue, 01 Sep 2026 00:40:44 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173f2758sm960412685a.37.2026.09.01.00.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:40:43 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 15:40:06 +0800
Subject: [PATCH v6 3/4] media: i2c: og0ve1b: Introduce per-sensor data
 structure
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-og0va1b-v6-3-a05b2d04c892@oss.qualcomm.com>
References: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788248425; l=10303;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=v7MWIqfZGj0yHDCscd2nMkMidCP3VrHdRkNj3te5k4Y=;
 b=98ApIynftEKaPmddBk6jSc+zz4ZN5QdQbdXFn5cZjVPYPvoP9PEr6QTnKHoXwv7xNItO2tevY
 xdcEeQVqsfrDfGoL7m4wrA2NgjDJ+qT1No5AmCQ3ADLjHcNmmeU5qSV
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NyBTYWx0ZWRfX9s4D7Y/qWGok
 /fzySGXuFjQUSf/76S3RHJRia0PYcCcmnL3iX1fuXV5KAeGq55ZtGPu7SxqcY7sibCxQRH5FeYv
 cWC1d7O5r1YLo+TnWWeQmUDz3+a/vnU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NyBTYWx0ZWRfX6Y9o81G98MAn
 C88P6K3EjpEgJ1r2txaXbmHPkc7faARRcaKbRjbla9zRpRvVSsNOn0F6kxIh/KK2lHKTuOyIkYp
 IJz5hCKC/OIYCnMulzlApmdFrKGjCADgrgnA/quQiMBc75VNpbviJT8gxaBh51oYm3btLS/Uvq6
 YNfvOXgLczCGIpdFXsJ6kZDCRFb5bHPARtJc/2c8nZdEeDswNdo5dMEac/bS9jGk67ZoGUGClRL
 kV2GHEW4uOl+pPu9+wT4dj4pvXWXXZoBkhP2rXotkb8sSa0+IBSsxhkULjoKx8qEA0tWVdIJV/b
 CXKZKxHDpIHN5fRM0n8Xy6qvcF6jLtqzP1Y977u8esb/vuy6+29o/H7pUlu5+8U16vsqvprtapR
 kQ8D676iiKjcPjt2YI9k9bTUGKkvqhT4lgHGG95JaDgW8iPjX4H/4Dvqmb2aadkls/zLjP9PDmJ
 cdv4qmti55F51seYRgg==
X-Proofpoint-GUID: RRdQjbMs2xsG95UDLnPy-sCOqab6q5N4
X-Proofpoint-ORIG-GUID: RRdQjbMs2xsG95UDLnPy-sCOqab6q5N4
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96817f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aIh3vjFOF9panSEBuokA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010067

Refactor the driver to separate sensor-specific data from the common
driver code. Introduce a sensor_data structure, populated through
i2c_get_match_data(), to hold the chip ID, MCLK frequency, link
frequencies and supported modes.

Test pattern programming is described by a per-sensor callback, and each
mode stores its media bus format code (rather than a bits-per-pixel
value) so that sensors with a different output format can be supported.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 100 +++++++++++++++++++++++++++++++-------------
 1 file changed, 72 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index da5c8e49d4a811f55736bd89c6922856f2e7391c..f560d5d90fda94abf4bc622c5e4f861b078b811f 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -5,6 +5,7 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -65,11 +66,23 @@ struct og0ve1b_mode {
 	u32 height;	/* Frame height in pixels */
 	u32 hts;	/* Horizontal timing size */
 	u32 vts;	/* Default vertical timing size */
-	u32 bpp;	/* Bits per pixel */
+	u32 code;	/* MEDIA_BUS_FMT code */
 
 	const struct og0ve1b_reg_list reg_list;	/* Sensor register setting */
 };
 
+struct og0ve1b;
+
+struct og0ve1b_sensor_data {
+	u64 chip_id;
+	unsigned long mclk_freq;
+	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
+	const s64 *link_freq_menu;
+	int num_link_freqs;
+	const struct og0ve1b_mode *modes;
+	int num_modes;
+};
+
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
 	"Standard Test Bar",
@@ -99,6 +112,8 @@ struct og0ve1b {
 
 	/* Saved register value */
 	u64 pre_isp;
+
+	const struct og0ve1b_sensor_data *data;
 };
 
 static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
@@ -247,13 +262,13 @@ static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
 	{ CCI_REG8(0x3f47), 0x35 },
 };
 
-static const struct og0ve1b_mode supported_modes[] = {
+static const struct og0ve1b_mode og0ve1b_supported_modes[] = {
 	{
 		.width = 640,
 		.height = 480,
 		.hts = 792,
 		.vts = 568,
-		.bpp = 8,
+		.code = MEDIA_BUS_FMT_Y8_1X8,
 		.reg_list = {
 			.regs = og0ve1b_640x480_120fps_mode,
 			.num_regs = ARRAY_SIZE(og0ve1b_640x480_120fps_mode),
@@ -273,11 +288,21 @@ static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
 }
 
+static const struct og0ve1b_sensor_data og0ve1b_data = {
+	.chip_id = OG0VE1B_CHIP_ID,
+	.mclk_freq = OG0VE1B_MCLK_FREQ_24MHZ,
+	.enable_test_pattern = og0ve1b_enable_test_pattern,
+	.link_freq_menu = og0ve1b_link_freq_menu,
+	.num_link_freqs = ARRAY_SIZE(og0ve1b_link_freq_menu),
+	.modes = og0ve1b_supported_modes,
+	.num_modes = ARRAY_SIZE(og0ve1b_supported_modes),
+};
+
 static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct og0ve1b,
 					       ctrl_handler);
-	const struct og0ve1b_mode *mode = &supported_modes[0];
+	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
 	s64 exposure_max;
 	int ret;
 
@@ -314,7 +339,7 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 				ctrl->val + mode->height, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
-		ret = og0ve1b_enable_test_pattern(og0ve1b, ctrl->val);
+		ret = og0ve1b->data->enable_test_pattern(og0ve1b, ctrl->val);
 		break;
 	default:
 		ret = -EINVAL;
@@ -330,10 +355,19 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops = {
 	.s_ctrl = og0ve1b_set_ctrl,
 };
 
+static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
+{
+	const struct og0ve1b_mode *mode = &data->modes[0];
+	unsigned int bpp = mode->code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
+
+	return div_u64(data->link_freq_menu[0], bpp);
+}
+
 static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
-	const struct og0ve1b_mode *mode = &supported_modes[0];
+	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
+	const struct og0ve1b_sensor_data *data = og0ve1b->data;
 	s64 exposure_max, pixel_rate, h_blank, v_blank;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *ctrl;
@@ -343,12 +377,12 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 
 	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &og0ve1b_ctrl_ops,
 				      V4L2_CID_LINK_FREQ,
-				      ARRAY_SIZE(og0ve1b_link_freq_menu) - 1,
-				      0, og0ve1b_link_freq_menu);
+				      data->num_link_freqs - 1,
+				      0, data->link_freq_menu);
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate = og0ve1b_link_freq_menu[0] / mode->bpp;
+	pixel_rate = og0ve1b_pixel_rate(data);
 	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  0, pixel_rate, 1, pixel_rate);
 
@@ -407,7 +441,7 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 static void og0ve1b_update_pad_format(const struct og0ve1b_mode *mode,
 				      struct v4l2_mbus_framefmt *fmt)
 {
-	fmt->code = MEDIA_BUS_FMT_Y8_1X8;
+	fmt->code = mode->code;
 	fmt->width = mode->width;
 	fmt->height = mode->height;
 	fmt->field = V4L2_FIELD_NONE;
@@ -421,8 +455,8 @@ static int og0ve1b_enable_streams(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state, u32 pad,
 				  u64 streams_mask)
 {
-	const struct og0ve1b_reg_list *reg_list = &supported_modes[0].reg_list;
 	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+	const struct og0ve1b_reg_list *reg_list = &og0ve1b->data->modes[0].reg_list;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(og0ve1b->dev);
@@ -484,13 +518,14 @@ static int og0ve1b_set_pad_format(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_format *fmt)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
 	struct v4l2_mbus_framefmt *format;
 	const struct og0ve1b_mode *mode;
 
 	format = v4l2_subdev_state_get_format(state, 0);
 
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes),
+	mode = v4l2_find_nearest_size(og0ve1b->data->modes,
+				      og0ve1b->data->num_modes,
 				      width, height,
 				      fmt->format.width,
 				      fmt->format.height);
@@ -505,10 +540,12 @@ static int og0ve1b_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_Y8_1X8;
+	code->code = og0ve1b->data->modes[0].code;
 
 	return 0;
 }
@@ -517,15 +554,18 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes))
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+	const struct og0ve1b_sensor_data *data = og0ve1b->data;
+
+	if (fse->index >= data->num_modes)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
+	if (fse->code != data->modes[fse->index].code)
 		return -EINVAL;
 
-	fse->min_width = supported_modes[fse->index].width;
+	fse->min_width = data->modes[fse->index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes[fse->index].height;
+	fse->min_height = data->modes[fse->index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
@@ -534,13 +574,14 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
 static int og0ve1b_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
+	const struct og0ve1b_mode *mode = &to_og0ve1b(sd)->data->modes[0];
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.pad = 0,
 		.format = {
-			.code = MEDIA_BUS_FMT_Y8_1X8,
-			.width = supported_modes[0].width,
-			.height = supported_modes[0].height,
+			.code = mode->code,
+			.width = mode->width,
+			.height = mode->height,
 		},
 	};
 
@@ -586,9 +627,9 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 		return ret;
 	}
 
-	if (val != OG0VE1B_CHIP_ID) {
-		dev_err(og0ve1b->dev, "chip id mismatch: %x!=%llx\n",
-			OG0VE1B_CHIP_ID, val);
+	if (val != og0ve1b->data->chip_id) {
+		dev_err(og0ve1b->dev, "chip id mismatch: %llx!=%llx\n",
+			og0ve1b->data->chip_id, val);
 		return -ENODEV;
 	}
 
@@ -624,8 +665,8 @@ static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
 	ret = v4l2_link_freq_to_bitmap(og0ve1b->dev,
 				       bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
-				       og0ve1b_link_freq_menu,
-				       ARRAY_SIZE(og0ve1b_link_freq_menu),
+				       og0ve1b->data->link_freq_menu,
+				       og0ve1b->data->num_link_freqs,
 				       &freq_bitmap);
 
 	v4l2_fwnode_endpoint_free(&bus_cfg);
@@ -686,6 +727,9 @@ static int og0ve1b_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	og0ve1b->dev = &client->dev;
+	og0ve1b->data = i2c_get_match_data(client);
+	if (!og0ve1b->data)
+		return -ENODEV;
 
 	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
 
@@ -700,7 +744,7 @@ static int og0ve1b_probe(struct i2c_client *client)
 				     "failed to get XVCLK clock\n");
 
 	freq = clk_get_rate(og0ve1b->xvclk);
-	if (freq && freq != OG0VE1B_MCLK_FREQ_24MHZ)
+	if (freq && freq != og0ve1b->data->mclk_freq)
 		return dev_err_probe(og0ve1b->dev, -EINVAL,
 				     "XVCLK clock frequency %lu is not supported\n",
 				     freq);
@@ -819,7 +863,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
 };
 
 static const struct of_device_id og0ve1b_of_match[] = {
-	{ .compatible = "ovti,og0ve1b" },
+	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, og0ve1b_of_match);

-- 
2.34.1

