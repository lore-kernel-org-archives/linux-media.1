Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7953F2DC32E
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480347; cv=none; b=jF1G5QYMwYEOhgIvNdtxlwrn6ckIFknclQzAYMeOlFJgO1er7qgTc0pPgbcjnk7lmHELynnutRDPf9IDQwtoeG/ya/tsGyIf0YankIOpMUIdWncgZmgxNsjciJxYcj22405GUDF6A6AfpzvMVtUAVC39fsTCGHg3Ymb9vYkC5XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480347; c=relaxed/simple;
	bh=v7MWIqfZGj0yHDCscd2nMkMidCP3VrHdRkNj3te5k4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IPFzY+p9R4G/PY1rzXWNzAMgT9av3EI4dAtGND4D4ER74sY7QtSbRmw6ru7b3Y0filKMLvkVU1triVnOYsWJOOjatzibAPwUhzpeCmuQTz3GMg1ZcC6CRnAVTaahnICIsnKOKoJvQH+EuVs5Zdu4XuulKftqT+4NC8DFan20jR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OysohSV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJAFm+Fl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OysohSV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJAFm+Fl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4ux7O3278062
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 06:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QX8sc1P0bS5z/s1DFAa4RJ5nBk8cITbsWxAeNOYvxes=; b=OysohSV+2m3jfK6O
	ek+gU0e5FCc+KttJmQnxeJY9ADRlzm/H3FFaqci+k+f5TQ12wSzM7qbBgZZFfDLQ
	ELUa5zX3aV2Rk9Agxa6nQ4Ia90QMAPr5Kz5IPVVk7cBxFVkg9lY8xU9J/lPH6Plx
	dO7b7di5Jxoouf5s/9x1u8yl5AeVIT+fWFZS8FKBFTU3bHUEu3dlNlKaZErSzxxM
	ZF1niuRwAzC1EF+/YXogvdMaqKPWAG6UE0pdPzbEEFjZRolI4Jf9zRlmITeaK9vO
	JeTkUJmFgy0APlSafiWpfZrUfOzHCIvVZl8M+7J8vx4c+WUZO/8CrEUc4dJLK978
	ua/ZbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn0f8cu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 06:45:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e55721a8cso70327985a.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785480344; x=1786085144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QX8sc1P0bS5z/s1DFAa4RJ5nBk8cITbsWxAeNOYvxes=;
        b=BJAFm+FluNKKMHhVuAd+HZSLG/yWhxtPVrncWr4Ry2gvHh+xkOxVvm5Jgnp3mPXpBW
         gniAAUgXHwK+/dH0L7tJgkkcWDqJESQ1LR3QlALCqM92DO7MGOLkdE/gEXSg2JIzuV76
         a+oztGIVMYUkU4TRjUFT+4/JdzF+219P1hiad6CtrsDTkuHHNQD9lbcL/+nBKkxqYfBQ
         4kKOXbaYFzRnawHJ2+gixYj2g0jM1yPZppA1bvvYtBPsUsqeaUy4EsV6JYICYOCb9NBa
         32S23lKRgmi1Vk+O8hAAspPBIXMwhcMXy7lJ++o87Jin09pCtLI3KuDcK1MHH9Ff+OYJ
         0rfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480344; x=1786085144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QX8sc1P0bS5z/s1DFAa4RJ5nBk8cITbsWxAeNOYvxes=;
        b=FpF97DTWJ7K9m10sy72ANC64MPmlJNUueHWiO9hbBjmcxqkQEsNSd3uAocI5ly8Dd2
         ZUoI5eN7MWxlVutV1JGyilSaqb1SATPUGYzUGBUi8Hsp1Ha6IiZjktby/FbjpxV1xrm5
         7LRZduL43yJvNSRL6R7oaVX7VJ+LEHDEngCEArKaHDKrn2tYpolZt8Ar1hacIa3BJMwS
         QRTWqyzDyeGsq8HB6Wh73Ire6nJz9bhHEKEuMVqJCAsuGdyVe8CODcZVHzhupRsi20nf
         Ul1nYfTGZW52dekOxpKvlY3/N78VPbF7VFlpsmBAdmd1jUnDhf4zxJGNrDpZDClhd44N
         uryg==
X-Gm-Message-State: AOJu0YxUI4DXFOcWpfi+DWoYVaDx4zrHzObte1td/Aq2JwweR2LQ0d2u
	WTIGehwlDi/dH0ZMotDmxqiDGe8YD5h3ZCx/yi5i+bKaAqRzrWP6vqLsL80Rexmg748r28phx/3
	/nfNGc8+rgTn9Kwp5P4qq1TIJzL1aRW4wYJqP25h5F9CNAj96qucBivvKNqgatIvJTA==
X-Gm-Gg: AR+sD13bpebgf2HJbE6u3sykoTpehYJ1DICU1vHgeDPd/pV4feDBjoiNLbHiqAvD/FG
	psOcbg+K/82+pyCMgz76LxrZt//busdDq5c+YKQtBHX503m1rRxuREAmIuNDPAWubFRZHYVtpKJ
	ejN8nuNb6KVqZZs3EhonTKY8909pTVSDtzqGXdVWz5e4T/IRZwVXMzbYOpTBPDrMn3VduJLegL+
	47I49gYXIqBDMO5got1CHVQGqHcGY8yL7ViqUZmFddZWFq9YgUTIdej2ttX5CgPXWIuhauW+TPT
	GMh4Ag5D3Co9rXpQXxzyMH100tHTWBU7ioMzfgNYirep4bsTiq0OMTUh97BUa+Pn5IoMi14Nu+v
	YI4QWfW4jBAZ3P4L6GJRB+FxSvrEJCkFa3vfi7Ld+lqr1vS2djSYipNMjOliiOTBXtBDX
X-Received: by 2002:a05:620a:269a:b0:92e:520a:ffab with SMTP id af79cd13be357-9349ad168f2mr22250185a.38.1785480343611;
        Thu, 30 Jul 2026 23:45:43 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:92e:520a:ffab with SMTP id af79cd13be357-9349ad168f2mr22246685a.38.1785480343136;
        Thu, 30 Jul 2026 23:45:43 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-934971773ffsm46107685a.29.2026.07.30.23.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:45:42 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:44:56 +0800
Subject: [PATCH v5 3/4] media: i2c: og0ve1b: Introduce per-sensor data
 structure
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-og0va1b-v5-3-c2b90b601241@oss.qualcomm.com>
References: <20260731-og0va1b-v5-0-c2b90b601241@oss.qualcomm.com>
In-Reply-To: <20260731-og0va1b-v5-0-c2b90b601241@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785480319; l=10303;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=v7MWIqfZGj0yHDCscd2nMkMidCP3VrHdRkNj3te5k4Y=;
 b=T82jPshnhu4Gw0J9/gnKAMJdkwCuES3GjyZzbXj0uSsY0Ei0/FQ+vKVBDAZi9p6HdUY4JK2ZK
 NvHPr63qFmTBAhhwg1OkCIDCh/prQFKJPn6q4Jy9mdiZwK0y5nI8bJJ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfX+ZUgTIXe9hRM
 WmwMVniVLvL6ute+x3FziUr/J/Kwup0deUc8NCXTjYF7EUzUGc21WMwUuKjR/PQRMLEKbc/755y
 yieFN5ll3GG+3oJYZjliDND9MZ9H8RI=
X-Authority-Analysis: v=2.4 cv=HJTz0Itv c=1 sm=1 tr=0 ts=6a6c4498 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aIh3vjFOF9panSEBuokA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: i7OHrZyqKGHpE67xzuwLPbNc4Xdx25nL
X-Proofpoint-GUID: i7OHrZyqKGHpE67xzuwLPbNc4Xdx25nL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfXy2yXBIKIBHrF
 0qTWTbwTxzbPAiAGfBn6tzvtziovsJnfnGys8D7/oMBO4RmE0bDkHSyTlnnWDalCa5dSbML4Eja
 Oq9ocr9/9JZb6zE5EOsrySSq2f7wMkAAziellk5eDIf3JnUmxG3aSc4J8IwWSopV0mPwt+RtV4q
 HuA8Ir1Gx24L+D2AZT3CIQtiXm74ucDHrMNM2Yrx5IPVsu7ZXV/PfhMMOXolZLQZ7+Wclq7hoYK
 127jAGhn495TEzOT9bgGnm8SRuIfehxf+WVBCy8CBwVERH1/LUT2xDO4rZWIDSenpddduK5iaHV
 Q4g2ayE0TKKPZokV4yhem5NCjpu0f/cPg+Jih6JrtYYUUKxoJ8gosOeMpTBjYC63MWHyhAovWn7
 5ljYXFA16x1mS/FF+42+YRnC+HYAocAi7EZf62g0eyPr58wsxWsDXi8T9LA45TOS5qOMUmeEria
 +zja5puMDkO5pPxg+2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310045

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

