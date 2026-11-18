Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994918;
	b=d4d44uYDFqOaZntWjp9u/P6i60TVb0+crwVuWj4BZVXqNcxgaRtdi3fRyG3pbKR/WMfQ
	 f2ncaZlJYMMpMo8QkTui+0NDIP7TcXPiUmB3ZDGYeCIQpUqim/JZhYIO9TXRi/jQICdtP
	 f6sNYEJaMzYB4fEZUqpQcNibWyhkJbl+Qmu49NQz8vtNnBgt3id/WtwC70fQKaVtI4Ss1
	 MPwyf+3GXNh0anURJEtLLqCkVtDkg3lkRffs4MeMf+MZg9iH5a3iwN82C5T0q0Dr93IWZ
	 58oCjSt2PKgoH89vt7m9hKEA+aofgLqxfp4dkdnQTBlZC2VI8y7dthM1xtyfpD1cDfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994918;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7R/MG8MVxCDIVhRXob2kwGouNany+NyhkdChngQaRbc=;
	b=vo7ImVDJ6LyJqI0z1Kz6EVGdPNaSumx49Kftqf/ZQLqDiOkk+Nq0ntYX7C7bF4ibVINu
	 NplRIZRtBjrGjuBKuL+f3qIo2eUDBRqS5UopuMhqGyQ1UpKnfQ8GUH33PdrdYjqN6qDaa
	 bSYBRDlQwdSrZ4kmb6MqScU8JlmCM/pB5jFD9+Ha9TDTyac8qXk9ilTwpcpkyIeLiSywd
	 HpXa0MmCCkyui0QP10GK9FdxWjXyh38408C3rFKHgDNy0KUalfCQY3ZknN4dUJMdGbx8l
	 FrwzE1Zvtbnb/zRU7zl8iNSIJtky/r4h5Raf5OX3Ri/ZMd1aZUN7R6ollRZkLssbBbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mfyCYF8u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXH37jeu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EE2606A332
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09EE2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mfyCYF8u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXH37jeu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8Zw1Q1430560
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7R/MG8MVxCDIVhRXob2kwGouNany+NyhkdChngQaRbc=; b=mfyCYF8uW6nruTZE
	E/UakfA00SYE3X/Yyc2Y3DuafOQB1IApTZsrnccTt07SKlgJzDgI29fmedAa5p/Y
	sDyuWYFIyDCC6ZSe6lcjJ9a/3GxVnGLwdr+QZ2mD5uDluygadjefQbx8SVEAihpg
	wY8ACEXyNt688C5WCk2CEolCDaw4eghkegzY/B4Fzv0VjNigYAA5pHVHuBFlSNRB
	I8bx0RvTHDwEdH+VYISyUXGx9XVtNN3qxg8PH2SlkIIVemJPu9IUH82o9iGCQ4yV
	FiCWCf2L+J7L3E7EM9QZP8iPTJySue2IcGC+3qRdLPUauxekMjuVZ7cIjZF5JBVa
	jurheQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv92ch8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:41:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso879001a12.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 01:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994917; x=1795599717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7R/MG8MVxCDIVhRXob2kwGouNany+NyhkdChngQaRbc=;
        b=LXH37jeuVGkBzqHyQ5QEi/WX2UVvELuyXUOu9Nv9ejRqVoGXVbjctOz87j1cabeYfR
         /YWH12lxZSDHzAn5Bif7WdSmPRtImLCalJaTanKyI64Ss5tI0eAlrE4Tvzm8tzoOvQ9J
         W+skIdMHnCMYpKqtjcj8ulxa7+BL0tFQgXE6BtLP6nTyrAZLktfyQ9oMdd+aak1YnthA
         TdPC6kFfXy4k5YZxO8txu5oJCFRNx9aJtlG3nOwqdikG5YmPXm5DD1lD75Zd8wWvFLer
         ls/fvrJLPFKZMtuK88SEG1ViC7wQYqjNt/Gih3xPZ3SdlptXJeqQWCsP8rBviV2RHD6W
         oWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994917; x=1795599717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7R/MG8MVxCDIVhRXob2kwGouNany+NyhkdChngQaRbc=;
        b=fWTkphmiYpDHRoUyJwgz6UoFmAPaWRFg6k2EISo8LGrYpclFga0kxg4azkySrpVoZR
         zhKO1JYa2E92YV4yu5kukalmm+cDEFKqxymXEiIfztfZulxYjJFc5od/ACYpT3ekC1NT
         otMzxLxJrtrWswSKyKdcFMZaiJWM9yT5wpasRhjZitGbljxoxQpQwiwsoddbMnDOUWjQ
         dW6UBxLA310aYKIn0PPo9NzhCAxP9T3rKylGHnfi0OPouit1KGQJ6YLs5etoAMrGymky
         wVupLgasFG9e4PVX37hFPJziFfMLYXGYF9VZ4vhC+X4JhnG7BX0x4ggDKg7+Hry3YAHJ
         nELA==
X-Forwarded-Encrypted: i=1; AL+hErGGuxbU7FwimOt8TCUJMFIeNp2WgvlBXfJY+ibYVKsKCGEjq50seF0FDkoOm+jmX11mT2Gl0TD3WYLzzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qToa33Nd4aOflen4hExgei2LpAl4EhzI3RuJA437V3/qVJRZ9
	gIaJcotJKEYelO3sxw/1kWbBbiRoOd83IQb9nwBb4/C02v4ytUG3siT8PytW1KaahQouDftUVjn
	By4QUgmGclzbbUruTB4Hxkm1GqTWUaTiMor/76doYYJFML74zuV3/R2dno1dY8MDH7Q==
X-Gm-Gg: AZFdTZflLrZll0jGOK7RK33t0ndfWX1TUPXOkgLtMQgtvSrijXGeclMUXLGlzS0zkOO
	1Q7TSlIkS+JgjEGNDU0MYzSygfoQ8VB0zr97P8afuFla/iVqGcvuWm+is/+YHifnTV1q4RcrK6V
	e/3wwsr2XilaQ1mTFX0CEtmEsDUmlVABwdAb7z/U109BLI3N7EUSXguH84FPgyZJG1SVsBlBLkD
	3yp5c0XZZSJsVdk1qnDbWKz+kKgLZlBKqgtBT323GfWrmfnQHX825idebfA+KfaS8lYXLxVMkc4
	/wD6P6BuJYsGcSRDV+ln4d2Enj8cKyXuVfIClXWteqImtdglHvPAcjLCTB3U/vx6UqLLG8yvIz5
	NHNb6LHfzG15EEOv1VbHR4v/EReMXxkKEFhscOzfhir3Bzbe9JChQmpd/qB1KRuNekEftNgYq2R
	JLYgORqNw9QTZ+n+/kd6XfEjuKOoqZLL5HIxMzfFcR3hnVZtZz
X-Received: by 2002:a17:902:e74d:b0:2ed:21fb:e764 with SMTP id d9443c01a7336-2eff73f208cmr21227725ad.16.1794994916635;
        Wed, 18 Nov 2026 01:41:56 -0800 (PST)
X-Received: by 2002:a17:902:e74d:b0:2ed:21fb:e764 with SMTP id d9443c01a7336-2eff73f208cmr21227425ad.16.1794994916095;
        Wed, 18 Nov 2026 01:41:56 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:41:55 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:41 +0800
Subject: [PATCH v3 2/8] media: iris: move shared APV PM helpers to
 iris_vpu_common
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-add_iris_for_hawi-v3-2-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=12138;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=3IhCXwVThfWldjsctcBzj2ctgAql8P+hgt1hBo96odI=;
 b=gttu+KshVed7AZtQpMq0ZKv3lD2jXSpaigE2W+RHFoz/SNFlaJ7Duu8lGOvmHlWOx0s/BzTcZ
 BKNnoh5oF/BA9jpYktbG4JWRlg0Yt3dDcZf0MpeClKSftAWzdrYO+Ad
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX4WvjOVEh4+ep
 SLq1pDflbOeLg3tGvIgH2oLeyf1+4JwD8fDC/yHWk2XQBeCHK6CIPSuopDDt5hgauvLvuWRCagN
 4k/qYkaMmWm0a79Tnkd4eDpaJGIPUmUjN1NGyAVGQiTdFT38MCWYaLp/TNBSRUoKKdxnoRzMaxq
 e8Lgj7KKSuKkD6a65LSoSDRjJPiukZPvHxlk+0p2GbNig5qbtde8yDqKKRWRxdbAbXhGV7Wg29Q
 NV6DSH5T5QEh3li37CV9Rfm4wCAREMnYJuF7w1UoP1lE4c6dT7MQbqPRPwERjYFIq7oXZhAUK9i
 OF/CZmEYvmC8B5y2hxcaHBt6x9ON+DBkTut6sBadsBlUXcduVaitKuGcNsQ09GAoGwGEM5SMdhM
 wRYh3BepuuQh18Fyl+ACib2lDQf26jgqoqjtgyhKxNSfyScJuvhlYQhZjMEgYROnM6etDkUmoTi
 jOKgR8foWN+S85VBejA==
X-Proofpoint-GUID: xTjlyRGoxRLkaenHAaA3dfxieqbVemcB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX/6S6lm5SuQNy
 +fvlMzIlCQ5pBhztZEjABLzfi9Zu3b5f98N0+v/D4snOHwQBap9k6qc4IBXmEFP50+iCSICVGZX
 cRwVEDx74am1eQnIEIHCtGQ0SA8luYY=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd72e5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kuoUquXy40ERufgRhccA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: xTjlyRGoxRLkaenHAaA3dfxieqbVemcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

The APV power on/off sequences and AHB bridge sync reset helpers are
currently local to iris_vpu4x.c. VPU5x uses the same sequences, so keeping
them in the VPU4x implementation would either prevent reuse or require
duplicating the code.

Move the helpers to iris_vpu_common.c and rename them with a vpu4x_vpu5x
prefix to reflect their shared usage.

Move the associated register constants, including APV_CLK_HALT, the efuse
control bits, CPU_CS_APV_BRIDGE_SYNC_RESET, WRAPPER_EFUSE_MONITOR, and
AON_WRAPPER_MVP_NOC_RESET_SYNCRST, to iris_vpu_register_defines.h so both
implementations can use them.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 92 +---------------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 74 +++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  4 +
 .../platform/qcom/iris/iris_vpu_register_defines.h | 14 ++++
 4 files changed, 96 insertions(+), 88 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 9d89d3f00acf7a3a5e1061477c4be5d085ff1a20..616da013a4503086040bddd942e1207e8a10069e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -10,18 +10,7 @@
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
-#define AON_WRAPPER_MVP_NOC_RESET_SYNCRST	(AON_MVP_NOC_RESET + 0x08)
-#define CPU_CS_APV_BRIDGE_SYNC_RESET		(CPU_BASE_OFFS + 0x174)
 #define MVP_NOC_RESET_REQ_MASK			0x70103
-#define VPU_IDLE_BITS				0x7103
-#define WRAPPER_EFUSE_MONITOR			(WRAPPER_BASE_OFFS + 0x08)
-
-#define APV_CLK_HALT		BIT(1)
-#define CORE_CLK_HALT		BIT(0)
-#define CORE_PWR_ON		BIT(1)
-#define DISABLE_VIDEO_APV_BIT	BIT(27)
-#define DISABLE_VIDEO_VPP1_BIT	BIT(28)
-#define DISABLE_VIDEO_VPP0_BIT	BIT(29)
 
 static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32 efuse_value)
 {
@@ -63,79 +52,6 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 	return ret;
 }
 
-static int iris_vpu4x_power_on_apv(struct iris_core *core)
-{
-	return iris_enable_power_domain_and_clocks(core, core->apv);
-}
-
-static void iris_vpu4x_power_off_apv(struct iris_core *core)
-{
-	bool handshake_done, handshake_busy;
-	u32 value, count = 0;
-	int ret;
-
-	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
-
-	if (value & APV_CLK_HALT)
-		writel(0x0, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
-
-	do {
-		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
-		usleep_range(10, 20);
-		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
-
-		handshake_done = value & NOC_LPI_STATUS_DONE;
-		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
-
-		if (handshake_done || !handshake_busy)
-			break;
-
-		writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
-		usleep_range(10, 20);
-
-	} while (++count < 1000);
-
-	if (!handshake_done && handshake_busy)
-		dev_err(core->dev, "LPI handshake timeout\n");
-
-	writel(0x080200, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
-				 value, value & 0x080200, 200, 2000);
-	if (ret)
-		goto disable_clocks_and_power;
-
-	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
-	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
-				 value, value == 0x0, 200, 2000);
-	if (ret)
-		goto disable_clocks_and_power;
-
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
-	       CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-
-disable_clocks_and_power:
-	iris_disable_power_domain_and_clocks(core, core->apv);
-}
-
-static void iris_vpu4x_ahb_sync_reset_apv(struct iris_core *core)
-{
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
-	       CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-}
-
-static void iris_vpu4x_ahb_sync_reset_hardware(struct iris_core *core)
-{
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
-	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
-}
-
 static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 {
 	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
@@ -158,7 +74,7 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 	}
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
-		ret = iris_vpu4x_power_on_apv(core);
+		ret = iris_vpu_power_on_apv(core);
 		if (ret)
 			goto disable_vpp1_power_domain;
 	}
@@ -187,7 +103,7 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 	iris_vpu4x_genpd_set_hwmode(core, false, efuse_value);
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
-		iris_vpu4x_power_off_apv(core);
+		iris_vpu_power_off_apv(core);
 
 	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
 
@@ -254,9 +170,9 @@ static int iris_vpu4x_set_hwmode(struct iris_core *core)
 	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
-		iris_vpu4x_ahb_sync_reset_apv(core);
+		iris_vpu_ahb_sync_reset_apv(core);
 
-	iris_vpu4x_ahb_sync_reset_hardware(core);
+	iris_vpu_ahb_sync_reset_hardware(core);
 
 	return iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 4ea7bfd204df01da65c2c05e3337f1caf1326844..9a32e95b95db844df8298533f875fb0a1dc5c728 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -21,6 +21,7 @@
 #define CTRL_INIT_IDLE_MSG_BMSK			0x40000000
 #define CTRL_ERROR_STATUS__M			0xfe
 #define CTRL_STATUS_PC_READY			0x100
+#define NOC_RESET_APV				0x080200
 
 #define QTBL_INFO				(CPU_CS_BASE_OFFS + 0x50)
 #define QTBL_ENABLE				BIT(0)
@@ -455,6 +456,79 @@ int iris_vpu_power_on(struct iris_core *core)
 	return ret;
 }
 
+int iris_vpu_power_on_apv(struct iris_core *core)
+{
+	return iris_enable_power_domain_and_clocks(core, core->apv);
+}
+
+void iris_vpu_power_off_apv(struct iris_core *core)
+{
+	bool handshake_done, handshake_busy;
+	u32 value, count = 0;
+	int ret;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	if (value & APV_CLK_HALT)
+		writel(0x0, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	do {
+		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
+
+		handshake_done = value & NOC_LPI_STATUS_DONE;
+		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		dev_err(core->dev, "LPI handshake timeout\n");
+
+	writel(0x080200, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, value & 0x080200, 200, 2000);
+	if (ret)
+		goto disable_clocks_and_power;
+
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, value == 0x0, 200, 2000);
+	if (ret)
+		goto disable_clocks_and_power;
+
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+
+disable_clocks_and_power:
+	iris_disable_power_domain_and_clocks(core, core->apv);
+}
+
+void iris_vpu_ahb_sync_reset_apv(struct iris_core *core)
+{
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+}
+
+void iris_vpu_ahb_sync_reset_hardware(struct iris_core *core)
+{
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+}
+
 void iris_vpu_set_preset_registers(struct iris_core *core)
 {
 	writel(0x0, core->reg_base + 0xb0088);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index a62b6184bde7e07bf50b001b8c95e1ffd2b29fca..126555877561e3a9bbaef7fa4da329bbe6645d46 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -46,6 +46,10 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core);
 int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
+int iris_vpu_power_on_apv(struct iris_core *core);
+void iris_vpu_power_off_apv(struct iris_core *core);
+void iris_vpu_ahb_sync_reset_apv(struct iris_core *core);
+void iris_vpu_ahb_sync_reset_hardware(struct iris_core *core);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
 void iris_vpu_interrupt_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 4fffa094c52fe4d05d5e5d52f8c6bf891318320a..60101fdcdb92e7a9f74921e297d17d76faf5620a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -19,6 +19,7 @@
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
 
 #define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
+#define AON_WRAPPER_MVP_NOC_RESET_SYNCRST	(AON_MVP_NOC_RESET + 0x08)
 
 #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
 #define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
@@ -40,6 +41,14 @@
 #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
 #define MSK_CORE_POWER_ON			BIT(1)
 
+#define CPU_CS_APV_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x174)
+
+/* Efuse bits controlling optional hardware blocks */
+#define WRAPPER_EFUSE_MONITOR			(WRAPPER_BASE_OFFS + 0x08)
+#define DISABLE_VIDEO_APV_BIT			BIT(27)
+#define DISABLE_VIDEO_VPP1_BIT			BIT(28)
+#define DISABLE_VIDEO_VPP0_BIT			BIT(29)
+
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
@@ -61,6 +70,7 @@
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
 #define CORE_CLK_RUN				0x0
+#define APV_CLK_HALT				BIT(1)
 
 #define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
 
@@ -74,4 +84,8 @@
 #define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
 #define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
 
+#define VPU_IDLE_BITS				0x7103
+#define CORE_CLK_HALT				BIT(0)
+#define CORE_PWR_ON				BIT(1)
+
 #endif

-- 
2.43.0

