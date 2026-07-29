Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65B43E492
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312313; cv=none; b=g2NmpZ5bP/UYHTtzVR4qQy3PNSCVo45+oujdydKvuF+a1L9Yza01IrFSrJnhXSiT+twBQTwNHCWcbuMeWuciUaZyRvtaphW2dqHVTLYnWJBt94GhpRxLTVc7fsWZKtDDFmFx7APgNzxafDTY7kD4UnmeoENStWQ3KdmC9UWCO10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312313; c=relaxed/simple;
	bh=xSTRYc11Z5wi3GO+Jq2eImIviy3GkRHkrx/FWYYBthg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PM9fUVgel6j7glq8gG0VLqDINH6dZfnJTOtmaLGmWFT07YIEoEInoKy5sHf4Is2xAli+lL6vSTOBVwJz48pC7zE5HenkyamBpgVOD4rEPbBnAWtOnJaJOHXO58zYUDzKseChhQtOHIsjxZCwzlUNowIpuwyCwt3HmjKr1xohTVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vz2mdjaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8r5twkK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vz2mdjaG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8r5twkK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7etHK944297
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LLkPvrA/Tcomebna1Rpr9teGgRrX7jnWi3qASe4YJ+A=; b=Vz2mdjaGrJxKnKLF
	Vbkv+jrZgorpftmckhzLxIGqnUIXMlF6zjJgRSHzVcZ5Eo29XI8ouTGzdoZrlO/y
	HPaPe/+mfitYJxZg6oxGrej/mEGztUab6p14tSp44pMKTf2ulS0E5Hat0ZAvG4/Z
	7vYtexmX4kN2M+2URXF99VM3J89bin+ouLpxV8MRr9y77m0cG7f48sbj2TU3tiHp
	NqbByAlRCAgTCzCfOAJuq7sfEf2ju8ANPNBtdKdTJwgZ2KXXKT3HiJgNrob1jzry
	xUHJpBF8TuhNeAbpFzqE8+muebMYtX9kAtdEQJy8F07dsefXEbN5G43PN1HgX9/0
	qYZBBA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm0h7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:05:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso711731cf.0
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 01:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785312309; x=1785917109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLkPvrA/Tcomebna1Rpr9teGgRrX7jnWi3qASe4YJ+A=;
        b=T8r5twkKqYWYpevcQ1WwqNLU+KR/weqbN85sW70LgAjrBp2YWkEIQ/HEgmGZVtaHqE
         BpXGGe7ufO8hNuhXs33IV0hsLFQ/f+mBSNKVoPWgZvZ3QkMRyILAu6vz/HRVjg1JXmpJ
         kdo3wMcWzbgOS2kA7+DbgVtF80AvY1EYfIyxDU6gYUB66gapIsHGNyqWIvvF+9CCqMuq
         Wn8XtCafvoA3emiPV6icq/BQe5PuZ61Ok6rAfQsmVupEedMic9DU0G1cncvOCgIBjfjz
         aG2UaTtCWt0T6T7eNmJ9TOtlwDPvFfDHSFavmjXSmY79P+OhSgfdvW2N3Co24G2d/Yis
         bsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312309; x=1785917109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLkPvrA/Tcomebna1Rpr9teGgRrX7jnWi3qASe4YJ+A=;
        b=JlbE6VMMBdzA4Clfpf07rq0hKTDOwVBP75OekNYhYM/bHtJ2zKrICdzwLCr4TZHH4o
         czxOz77XVIwVmEJIy7NkTBFe3IHX4ItjoLC2yziDdv/Q/ixbrHEs/H/xjir3vWdSEmCJ
         2ZVXnqu0ufJLkSceNtNZSvi/HvnKgjMPiEMWaYTsNN3pqKLBOATBoWmLo0SQO/x7NNF3
         0I+CcCu3FUgoXfUIqQcXBHkjBZNbMwMhtLaSvpB2wpauHeha1Wi4P3Xk6+vwF8Q/CPBT
         aYkUCReZKyRMhlUup4bSenNOXRoDlqW5wP79rw40Ftbzx7wNRkBKVtB2Cub+eO1r7qk/
         POiA==
X-Gm-Message-State: AOJu0YyMwWgo3Whf7OapSnEXf+zzoHBFLPHgEZB4ysQmhP5sFW4/zC7l
	Fqy1gtUDihjdKi518q+al8TcxEsQk0GG7axIle+ZhROwwaXJtPRq8RCuySNxkKm1/VfbE8Xpj9s
	5EIC4T+AGtpGUP9iWURyiZqWuHm1XkHyy+PGRmNmx98iFVAmB0vBi6/y6mrU2obK45g==
X-Gm-Gg: AR+sD119uV5sXYSzTkGIycP349H1ulpBA1Ji5eMG0pQAvnMKZyzqdF7v/9826B+yqT8
	mlwGeTZxD3z7PgMGocyaeCkVZLV523ojIHiMa+cUlX36QptFEcvMuke32HeliIfF7kHEpn+idR+
	Za2LHzwLsj1R3imSvssgWNS5EILXFYA08kQJNlbeq6B8McESl83clvEETxD5+1PeQCujE2iAS0t
	HEn501dE8zN0ysCMfcXxiZMxJdmUiPPDhNxwTQEX1DW5FGD1JmoJwxFtyP5yxBV8MigLP8sb8EQ
	GuLchahY1HJVSbCgbrD6ECdzIC7HmmVln4Ywwlk8epqcRArTQ+tgX0Rg6zQkB3qKRIfRDMh3txf
	Mx2lpEuON8PToqyMLg0c15eOi6wvTdp3YkmyQqeaMI8yv/83GXhJub1HaYsLg2EBr5Ltm
X-Received: by 2002:ac8:7c54:0:b0:51a:8c86:bd2f with SMTP id d75a77b69052e-52b2ae1f254mr8443321cf.36.1785312309328;
        Wed, 29 Jul 2026 01:05:09 -0700 (PDT)
X-Received: by 2002:ac8:7c54:0:b0:51a:8c86:bd2f with SMTP id d75a77b69052e-52b2ae1f254mr8443071cf.36.1785312308821;
        Wed, 29 Jul 2026 01:05:08 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e30f2a96sm13772631cf.28.2026.07.29.01.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:05:07 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:04:33 +0800
Subject: [PATCH v4 4/4] media: i2c: og0ve1b: Add support for OmniVision
 OG0VA1B
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-og0va1b-v4-4-ec7e7ed87b2b@oss.qualcomm.com>
References: <20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com>
In-Reply-To: <20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785312282; l=13926;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=xSTRYc11Z5wi3GO+Jq2eImIviy3GkRHkrx/FWYYBthg=;
 b=NxDR0jTN0AW3YedS7VFi/I1C6EyC8vxJAFM4+HO0xdzcEby3IbCNxHQoHZ7qeaVCY/cP5iff8
 5gEQooh2M1iDgyFWdn0VmPVrdPQIyW+uIgXN0DKYks4SGktug5tP8eB
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: mFb8IvijNnIi0EyGm5uxwgUz9JjCYScW
X-Proofpoint-ORIG-GUID: mFb8IvijNnIi0EyGm5uxwgUz9JjCYScW
X-Authority-Analysis: v=2.4 cv=R/Uz39RX c=1 sm=1 tr=0 ts=6a69b436 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kvSDJSb0XTZWr82cfuIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfXyf9hJH2JvXa2
 5aF/SG4/3WHq0m7mIiCDMCcasJRxwu6agoBORyqP4a/8TKDZ9PyVB0B7Yl7biXYkLQ1c1mYCc8h
 iTjrn/M6Hgmob4AhBXC+yzqtmcjRlYlGVXLPmXd9mZgayLWWypqGqDdVGYzJi5H173DuAvObJjw
 FgS8F+/w/g+dQXYP7z5u8pPJKbe56IhHgk+I2/XCZihCRuWt2uEYciqCRHPHwJ38bSGGjoyQ1jE
 kpWfeypva+84Iq0SwUklwn6RuJQnLHxu8FbMLiJcfJjtfKpPZSLrzVMgMSGu4oIlwxqfhdELyj3
 wyWlxatIE8ixjvdf8DW5h5JpubCM+7P4GpUUhwAwJLWuZ5qnBmNpqCfSGpOzVhY7iR1sxkDXS1Y
 hDUVOeH5/wztc7dkf2icdUWAcp2lkpsNVY3uZQQegyMkb8dyIQhCuwEPlCNt9AzK6wqQIFL36wi
 BMw4Si0hyRsMtQhHo/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfXztJUSaRqcWv5
 naWptkhcyNKtcCeHhITSs+UTRKEBCaza7fi45yQslOdQEChNOIsprDe7XhMUC3/S5z7HtDwRd/P
 34aW7j4s7U8BPC8kZTnyb7foN0G29Qk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290064

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the OG0VE1B. It shares the SCCB control interface, power supplies and
the single-lane MIPI D-PHY description, and differs in its chip id, the
test pattern register, the register programming and the output format
(10-bit RAW instead of 8-bit).

Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
its 640x480 60fps register sequence.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org> # og0ve1b
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 278 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 266 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index df428137cfdc1a0936c9bc936d015ed2a649c218..1d220515de4bb199618d0f08ded5f975c7bd04c6 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -14,10 +14,14 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 
+#define OG0VA1B_LINK_FREQ_480MHZ	(480 * HZ_PER_MHZ)
+#define OG0VA1B_MCLK_FREQ_19_2MHZ	(19200 * HZ_PER_KHZ)
+
 #define OG0VE1B_LINK_FREQ_500MHZ	(500 * HZ_PER_MHZ)
 #define OG0VE1B_MCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)
 
-#define OG0VE1B_REG_CHIP_ID		CCI_REG24(0x300a)
+#define OG0V_REG_CHIP_ID		CCI_REG24(0x300a)
+#define OG0VA1B_CHIP_ID			0xc75641
 #define OG0VE1B_CHIP_ID			0xc75645
 
 #define OG0VE1B_REG_MODE_SELECT		CCI_REG8(0x0100)
@@ -45,12 +49,18 @@
 #define OG0VE1B_REG_VTS			CCI_REG16(0x380e)
 #define OG0VE1B_VTS_MAX			0xffff
 
-/* Test pattern */
+/* Test pattern - OG0VA1B uses 0x5100, OG0VE1B uses 0x5e00 */
+#define OG0VA1B_REG_TEST_PATTERN	CCI_REG8(0x5100)
+#define OG0VA1B_TEST_PATTERN_BAR_SHIFT	2
 #define OG0VE1B_REG_PRE_ISP		CCI_REG8(0x5e00)
 #define OG0VE1B_TEST_PATTERN_ENABLE	BIT(7)
 
 #define to_og0ve1b(_sd)			container_of(_sd, struct og0ve1b, sd)
 
+static const s64 og0va1b_link_freq_menu[] = {
+	OG0VA1B_LINK_FREQ_480MHZ,
+};
+
 static const s64 og0ve1b_link_freq_menu[] = {
 	OG0VE1B_LINK_FREQ_500MHZ,
 };
@@ -73,15 +83,31 @@ struct og0ve1b_mode {
 struct og0ve1b;
 
 struct og0ve1b_sensor_data {
+	const char *name;
 	u64 chip_id;
 	unsigned long mclk_freq;
 	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
+	const char * const *test_pattern_menu;
+	int num_test_patterns;
+	bool cache_test_pattern_reg;
+	/* Exposure register unit: OG0VE1B 1/16 line (4), OG0VA1B whole lines (0). */
+	unsigned int exposure_shift;
+	/* Pixel rate multiplier: OG0VA1B uses CSI-2 DDR (2), OG0VE1B keeps 1. */
+	unsigned int pixel_rate_mul;
 	const s64 *link_freq_menu;
 	int num_link_freqs;
 	const struct og0ve1b_mode *modes;
 	int num_modes;
 };
 
+static const char * const og0va1b_test_pattern_menu[] = {
+	"Disabled",
+	"Standard Test Bar",
+	"Top-Bottom Darker Test Bar",
+	"Right-Left Darker Test Bar",
+	"Bottom-Top Darker Test Bar",
+};
+
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
 	"Standard Test Bar",
@@ -115,6 +141,196 @@ struct og0ve1b {
 	const struct og0ve1b_sensor_data *data;
 };
 
+static const struct cci_reg_sequence og0va1b_640x480_60fps_mode[] = {
+	{ CCI_REG8(0x0302), 0x31 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0304), 0x01 },
+	{ CCI_REG8(0x0305), 0x90 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0323), 0x02 },
+	{ CCI_REG8(0x0325), 0x68 },
+	{ CCI_REG8(0x0326), 0xd8 },
+	{ CCI_REG8(0x3006), 0x0e },
+	{ CCI_REG8(0x300d), 0x08 },
+	{ CCI_REG8(0x3018), 0xf0 },
+	{ CCI_REG8(0x301c), 0xf0 },
+	{ CCI_REG8(0x3020), 0x20 },
+	{ CCI_REG8(0x3040), 0x0f },
+	{ CCI_REG8(0x3022), 0x01 },
+	{ CCI_REG8(0x3107), 0x40 },
+	{ CCI_REG8(0x3216), 0x01 },
+	{ CCI_REG8(0x3217), 0x00 },
+	{ CCI_REG8(0x3218), 0xc0 },
+	{ CCI_REG8(0x3219), 0x55 },
+	{ CCI_REG8(0x3506), 0x01 },
+	{ CCI_REG8(0x3507), 0x50 },
+	{ CCI_REG8(0x3508), 0x01 },
+	{ CCI_REG8(0x3509), 0x00 },
+	{ CCI_REG8(0x350a), 0x01 },
+	{ CCI_REG8(0x350b), 0x00 },
+	{ CCI_REG8(0x350c), 0x00 },
+	{ CCI_REG8(0x3541), 0x00 },
+	{ CCI_REG8(0x3542), 0x40 },
+	{ CCI_REG8(0x3605), 0x90 },
+	{ CCI_REG8(0x3606), 0x41 },
+	{ CCI_REG8(0x3612), 0x00 },
+	{ CCI_REG8(0x3620), 0x08 },
+	{ CCI_REG8(0x3630), 0x17 },
+	{ CCI_REG8(0x3631), 0x99 },
+	{ CCI_REG8(0x3639), 0x88 },
+	{ CCI_REG8(0x3668), 0x00 },
+	{ CCI_REG8(0x3674), 0x00 },
+	{ CCI_REG8(0x3677), 0x3f },
+	{ CCI_REG8(0x368f), 0x06 },
+	{ CCI_REG8(0x36a2), 0x19 },
+	{ CCI_REG8(0x36a4), 0xf1 },
+	{ CCI_REG8(0x36a5), 0x2d },
+	{ CCI_REG8(0x3706), 0x30 },
+	{ CCI_REG8(0x370d), 0x72 },
+	{ CCI_REG8(0x3713), 0x86 },
+	{ CCI_REG8(0x3715), 0x03 },
+	{ CCI_REG8(0x3716), 0x00 },
+	{ CCI_REG8(0x376d), 0x24 },
+	{ CCI_REG8(0x3770), 0x3a },
+	{ CCI_REG8(0x3778), 0x00 },
+	{ CCI_REG8(0x37a8), 0x03 },
+	{ CCI_REG8(0x37a9), 0x00 },
+	{ CCI_REG8(0x37df), 0x7d },
+	{ CCI_REG8(0x3800), 0x00 },
+	{ CCI_REG8(0x3801), 0x00 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x02 },
+	{ CCI_REG8(0x3805), 0x8f },
+	{ CCI_REG8(0x3806), 0x01 },
+	{ CCI_REG8(0x3807), 0xef },
+	{ CCI_REG8(0x3808), 0x02 },
+	{ CCI_REG8(0x3809), 0x80 },
+	{ CCI_REG8(0x380a), 0x01 },
+	{ CCI_REG8(0x380b), 0xe0 },
+	{ CCI_REG8(0x380c), 0x01 },
+	{ CCI_REG8(0x380d), 0x78 },
+	{ CCI_REG8(0x380e), 0x08 },
+	{ CCI_REG8(0x380f), 0x30 },
+	{ CCI_REG8(0x3810), 0x00 },
+	{ CCI_REG8(0x3811), 0x08 },
+	{ CCI_REG8(0x3812), 0x00 },
+	{ CCI_REG8(0x3813), 0x08 },
+	{ CCI_REG8(0x3814), 0x11 },
+	{ CCI_REG8(0x3815), 0x11 },
+	{ CCI_REG8(0x3816), 0x00 },
+	{ CCI_REG8(0x3817), 0x01 },
+	{ CCI_REG8(0x3818), 0x00 },
+	{ CCI_REG8(0x3819), 0x05 },
+	{ CCI_REG8(0x3820), 0x40 },
+	{ CCI_REG8(0x3821), 0x04 },
+	{ CCI_REG8(0x3823), 0x00 },
+	{ CCI_REG8(0x3826), 0x00 },
+	{ CCI_REG8(0x3827), 0x00 },
+	{ CCI_REG8(0x382b), 0x52 },
+	{ CCI_REG8(0x384a), 0xa2 },
+	{ CCI_REG8(0x3858), 0x00 },
+	{ CCI_REG8(0x3859), 0x00 },
+	{ CCI_REG8(0x3860), 0x00 },
+	{ CCI_REG8(0x3861), 0x00 },
+	{ CCI_REG8(0x3866), 0x0c },
+	{ CCI_REG8(0x3867), 0x07 },
+	{ CCI_REG8(0x3884), 0x00 },
+	{ CCI_REG8(0x3885), 0x08 },
+	{ CCI_REG8(0x3888), 0x50 },
+	{ CCI_REG8(0x3893), 0x6c },
+	{ CCI_REG8(0x3898), 0x00 },
+	{ CCI_REG8(0x389a), 0x04 },
+	{ CCI_REG8(0x389b), 0x01 },
+	{ CCI_REG8(0x389c), 0x0b },
+	{ CCI_REG8(0x389d), 0xdc },
+	{ CCI_REG8(0x38b1), 0x04 },
+	{ CCI_REG8(0x38b2), 0x00 },
+	{ CCI_REG8(0x38b3), 0x08 },
+	{ CCI_REG8(0x38c1), 0x46 },
+	{ CCI_REG8(0x38c9), 0x02 },
+	{ CCI_REG8(0x38d4), 0x06 },
+	{ CCI_REG8(0x38d5), 0x5a },
+	{ CCI_REG8(0x38d6), 0x08 },
+	{ CCI_REG8(0x38d7), 0x3a },
+	{ CCI_REG8(0x391f), 0x00 },
+	{ CCI_REG8(0x3920), 0xaa },
+	{ CCI_REG8(0x3921), 0x00 },
+	{ CCI_REG8(0x3922), 0x00 },
+	{ CCI_REG8(0x3923), 0x00 },
+	{ CCI_REG8(0x3924), 0x00 },
+	{ CCI_REG8(0x3925), 0x00 },
+	{ CCI_REG8(0x3926), 0x00 },
+	{ CCI_REG8(0x3927), 0x00 },
+	{ CCI_REG8(0x3928), 0x10 },
+	{ CCI_REG8(0x3929), 0x01 },
+	{ CCI_REG8(0x392a), 0xb4 },
+	{ CCI_REG8(0x392b), 0x00 },
+	{ CCI_REG8(0x392c), 0x10 },
+	{ CCI_REG8(0x392d), 0x01 },
+	{ CCI_REG8(0x392e), 0x78 },
+	{ CCI_REG8(0x392f), 0x4a },
+	{ CCI_REG8(0x391e), 0x01 },
+	{ CCI_REG8(0x389f), 0x08 },
+	{ CCI_REG8(0x38a0), 0x00 },
+	{ CCI_REG8(0x38a1), 0x00 },
+	{ CCI_REG8(0x3a06), 0x06 },
+	{ CCI_REG8(0x3a07), 0x78 },
+	{ CCI_REG8(0x3a08), 0x08 },
+	{ CCI_REG8(0x3a09), 0x80 },
+	{ CCI_REG8(0x3a52), 0x00 },
+	{ CCI_REG8(0x3a53), 0x01 },
+	{ CCI_REG8(0x3a54), 0x0c },
+	{ CCI_REG8(0x3a55), 0x04 },
+	{ CCI_REG8(0x3a58), 0x0c },
+	{ CCI_REG8(0x3a59), 0x04 },
+	{ CCI_REG8(0x4000), 0xcf },
+	{ CCI_REG8(0x4003), 0x40 },
+	{ CCI_REG8(0x4008), 0x04 },
+	{ CCI_REG8(0x4009), 0x13 },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x400b), 0x34 },
+	{ CCI_REG8(0x4010), 0x71 },
+	{ CCI_REG8(0x4042), 0xc3 },
+	{ CCI_REG8(0x4306), 0x04 },
+	{ CCI_REG8(0x4307), 0x12 },
+	{ CCI_REG8(0x4500), 0x70 },
+	{ CCI_REG8(0x4509), 0x00 },
+	{ CCI_REG8(0x450b), 0x83 },
+	{ CCI_REG8(0x4604), 0x68 },
+	{ CCI_REG8(0x481b), 0x44 },
+	{ CCI_REG8(0x481f), 0x30 },
+	{ CCI_REG8(0x4823), 0x44 },
+	{ CCI_REG8(0x4825), 0x35 },
+	{ CCI_REG8(0x4837), 0x11 },
+	{ CCI_REG8(0x4f00), 0x04 },
+	{ CCI_REG8(0x4f10), 0x04 },
+	{ CCI_REG8(0x4f21), 0x01 },
+	{ CCI_REG8(0x4f22), 0x00 },
+	{ CCI_REG8(0x4f23), 0x54 },
+	{ CCI_REG8(0x4f24), 0x51 },
+	{ CCI_REG8(0x4f25), 0x41 },
+	{ CCI_REG8(0x5000), 0x3f },
+	{ CCI_REG8(0x5001), 0x80 },
+	{ CCI_REG8(0x500a), 0x00 },
+	{ CCI_REG8(0x5100), 0x00 },
+	{ CCI_REG8(0x5111), 0x20 },
+};
+
+static const struct og0ve1b_mode og0va1b_supported_modes[] = {
+	{
+		.width = 640,
+		.height = 480,
+		.hts = 752,
+		.vts = 2096,
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.reg_list = {
+			.regs = og0va1b_640x480_60fps_mode,
+			.num_regs = ARRAY_SIZE(og0va1b_640x480_60fps_mode),
+		},
+	},
+};
+
 static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
 	{ CCI_REG8(0x30a0), 0x02 },
 	{ CCI_REG8(0x30a1), 0x00 },
@@ -275,6 +491,17 @@ static const struct og0ve1b_mode og0ve1b_supported_modes[] = {
 	},
 };
 
+static int og0va1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
+{
+	u64 val = 0;
+
+	if (pattern)
+		val = ((pattern - 1) << OG0VA1B_TEST_PATTERN_BAR_SHIFT) |
+		      OG0VE1B_TEST_PATTERN_ENABLE;
+
+	return cci_write(og0ve1b->regmap, OG0VA1B_REG_TEST_PATTERN, val, NULL);
+}
+
 static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 {
 	u64 val = og0ve1b->pre_isp;
@@ -287,10 +514,31 @@ static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
 }
 
+static const struct og0ve1b_sensor_data og0va1b_data = {
+	.name = "og0va1b",
+	.chip_id = OG0VA1B_CHIP_ID,
+	.mclk_freq = OG0VA1B_MCLK_FREQ_19_2MHZ,
+	.enable_test_pattern = og0va1b_enable_test_pattern,
+	.test_pattern_menu = og0va1b_test_pattern_menu,
+	.num_test_patterns = ARRAY_SIZE(og0va1b_test_pattern_menu),
+	.exposure_shift = 0,
+	.pixel_rate_mul = 2,
+	.link_freq_menu = og0va1b_link_freq_menu,
+	.num_link_freqs = ARRAY_SIZE(og0va1b_link_freq_menu),
+	.modes = og0va1b_supported_modes,
+	.num_modes = ARRAY_SIZE(og0va1b_supported_modes),
+};
+
 static const struct og0ve1b_sensor_data og0ve1b_data = {
+	.name = "og0ve1b",
 	.chip_id = OG0VE1B_CHIP_ID,
 	.mclk_freq = OG0VE1B_MCLK_FREQ_24MHZ,
 	.enable_test_pattern = og0ve1b_enable_test_pattern,
+	.test_pattern_menu = og0ve1b_test_pattern_menu,
+	.num_test_patterns = ARRAY_SIZE(og0ve1b_test_pattern_menu),
+	.cache_test_pattern_reg = true,
+	.exposure_shift = 4,
+	.pixel_rate_mul = 1,
 	.link_freq_menu = og0ve1b_link_freq_menu,
 	.num_link_freqs = ARRAY_SIZE(og0ve1b_link_freq_menu),
 	.modes = og0ve1b_supported_modes,
@@ -331,7 +579,8 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_EXPOSURE,
-				ctrl->val << 4, NULL);
+				ctrl->val << og0ve1b->data->exposure_shift,
+				NULL);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_VTS,
@@ -359,7 +608,7 @@ static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
 	const struct og0ve1b_mode *mode = &data->modes[0];
 	unsigned int bpp = mode->code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
 
-	return data->link_freq_menu[0] / bpp;
+	return data->link_freq_menu[0] * data->pixel_rate_mul / bpp;
 }
 
 static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
@@ -412,8 +661,8 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &og0ve1b_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(og0ve1b_test_pattern_menu) - 1,
-				     0, 0, og0ve1b_test_pattern_menu);
+				     data->num_test_patterns - 1,
+				     0, 0, data->test_pattern_menu);
 
 	if (ctrl_hdlr->error)
 		return ctrl_hdlr->error;
@@ -620,7 +869,7 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 	u64 val;
 	int ret;
 
-	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_CHIP_ID, &val, NULL);
+	ret = cci_read(og0ve1b->regmap, OG0V_REG_CHIP_ID, &val, NULL);
 	if (ret) {
 		dev_err(og0ve1b->dev, "failed to read chip id: %d\n", ret);
 		return ret;
@@ -632,10 +881,12 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 		return -ENODEV;
 	}
 
-	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
-		       &og0ve1b->pre_isp, NULL);
-	if (ret)
-		dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
+	if (og0ve1b->data->cache_test_pattern_reg) {
+		ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
+			       &og0ve1b->pre_isp, NULL);
+		if (ret)
+			dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
+	}
 
 	return ret;
 }
@@ -731,6 +982,8 @@ static int og0ve1b_probe(struct i2c_client *client)
 		return -ENODEV;
 
 	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
+	v4l2_i2c_subdev_set_name(&og0ve1b->sd, client,
+				 og0ve1b->data->name, NULL);
 
 	og0ve1b->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(og0ve1b->regmap))
@@ -862,6 +1115,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
 };
 
 static const struct of_device_id og0ve1b_of_match[] = {
+	{ .compatible = "ovti,og0va1b", .data = &og0va1b_data },
 	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
 	{ /* sentinel */ }
 };
@@ -880,5 +1134,5 @@ static struct i2c_driver og0ve1b_i2c_driver = {
 module_i2c_driver(og0ve1b_i2c_driver);
 
 MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");
-MODULE_DESCRIPTION("OmniVision OG0VE1B sensor driver");
+MODULE_DESCRIPTION("OmniVision OG0VE1B/OG0VA1B sensor driver");
 MODULE_LICENSE("GPL");

-- 
2.34.1

