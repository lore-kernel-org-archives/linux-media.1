Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BC64F96CE
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417294; cv=none; b=udzc3RENtScnHrWZrMvG9wNdk42V/UEawuqL3+rXpSabSmMwMf0MeWGvnfYGLFI9UwtlfsEoheYqx/u8ZTfEEYFpWE8guJoH1fX2zcDpHToxaKk/08m64Fs3vmAUrW7did1ITMP6JyCopv1cefXoRmmOKBgHPpMSwczj4rd2XI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417294; c=relaxed/simple;
	bh=tQn4IpcAQWTKRnzN3rSl5tamncU45CIHNxzgTC015xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZzAeZBjE8g04+1ctbmLwE11CdHIXZXkRDIgFpu0qAJ/rt9Z6+Wv5iY7PKBEQJUaN3ZCU4jkW9ChwaHyByF9X8sxIgDgeYWWtuF3SAYjJj6IP4dHBV4NSmTVAUI9oXxDhIZrmPqh7yf2htgNQx2/6vd8k65WaobvNtq5dg9+X5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XsA7yYFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=da3nBzdU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XsA7yYFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="da3nBzdU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P2DZ3306573
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeZt34r7XG1MrZbmlAFe/De4GqSWYwKCCqETP6sgsa8=; b=XsA7yYFjKq4hLyuC
	7CvQIKPYkvstSq9QHpuIvikHPMDjrilI0s8RdksEVRIFvU+mGMLre6ald4AvL6cl
	4vBbHZ/lw5vF7IROeeJs5frHy+sqWaWZn29ss3syRVe3o1nXq3kDBkSMWli8ZyEG
	r6eOfp8B83JWqmSf8Hm6I0NfHzEBR/w8p9qrVchfGYfNls2Vfy+sxvoptC81k60N
	aCpgsEc44K1iP2DCOuDLGos7ZLWdkcJ5vOhA01cPBXMrv9r63fW1AWdEQhmMHauL
	9Ve+f4beMBQW6Zcq9Rx9pWwo7FzN9upRMFt6Ffh/gZsd5ixjT2TwcUdeU5vt3Oo9
	OUySfg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47hc3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so367389285a.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 06:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417291; x=1793022091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeZt34r7XG1MrZbmlAFe/De4GqSWYwKCCqETP6sgsa8=;
        b=da3nBzdUMJUo+ftIGYBaqQIc1EO+fcNq+mOowmjy7MHShFKZxg8Kj0WQHwWXOSm9Cz
         BIX9S3yaD7YnPRcN8ZFGEGcRgYKPpAohhAbOrtQxjGCYcqMfOv5K8sXQP5AduTVsc53O
         WfiRd9Ds1qiP4KdHyqoPZZspvxKgO4dcTQAxLIereHzM7OrPF7Pp7vTmv/3UdHqXgGNp
         Ff1ht5h0msqUf0xSih8v7WvlwYAsZQqV9Db7dFXYOSS5SjWj1dAmvtAnsup4phcLXUis
         0azZurgQvsnB0xCZMgZ9p9MKol4aO+zGgX/7UEEnbxY4cZp7TOy3wJKbPLQIP9jSn9cI
         bBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417291; x=1793022091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeZt34r7XG1MrZbmlAFe/De4GqSWYwKCCqETP6sgsa8=;
        b=QVdvuF83d+koNXt3xq3b59Bhj+M7i2ewJXziSNM6AneqjoRQTFbCWQTq7Qqvy0Hxv3
         CLEgD10NvmQBhP+8wGNV2LhKEkQV59khIGh3rRc0DQymsnB7gu+H13WX/fApoZ4A+A7b
         BE9pkNCLBDzqpSptl29uGs8Ct7SpohCGubtssDSzjT3UkR5/PnNLZ8ZZBCZefF99XpWq
         xd+oxIwj5pyhSUh8VkKcB2ijlr1575tvATVKSDDzleV37LE1U4AIQdZFGj2s1bPPBY8N
         jzcLttUxEFATmv0FK2frG0EDYtUZk4EFoRxj5kv79Zh4GwZG4S6pIw+k9ZmYtQSgwQFa
         naOg==
X-Forwarded-Encrypted: i=1; AKwUvByHmTcXVQiyEVYZ3aYZX1rpGIChRNsHv+TFwepZHEwAc9Qgazsumd22unctGk3evC2jI18/bePgMNSXkw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLxHRqe/c4yoIa5JKa21JxRv67l97yjmyEumjJVJo8LGmquaFrk
	EVNcJ/YY4+oAUyWHpD823oC9I+2dBDcfDmRslpZ3njMZcQFMN0tDDmY0ImJns6ZQwC/qdERawUW
	8pOVXLCx/1NRinn3kbiFF4mkplVQp2hDZOo4vJlwT75kMbOq3nwT3EU2CRRoW6GnBFfVdGpQi7w
	==
X-Gm-Gg: AYBFou3E/dr0QO6wrHSFGrULcWcq5qQyJ4fIRG/A5UZz7xX/tuTcPHDwzd/AL+HtWkZ
	54+xgTj6aGUcq4BW6wptvkNKc8MTrfZIYAzhIjJdGcQJfhR/0i5LpoyfYg5QumtJ90ljOlI/zEc
	BLItqz4GNfhgbqwijw9FBesk6DlP9xe0tFmp/+Z+Cg+KCPcXEwOsUq4cXU8OiPa8HkxVD1GgMTr
	mBkZJXKPkIfqhLIcx30Joy6o5LUKzxNASz4SvHzYIoygWzFWnKEvuMZ68aQ6Xbor7BYPjqlAxDo
	J4QciVzxyAFj4UPIzuYihCe/C9UkdkumGzKdUho/xna52vl9Ap6QfVlURrbCPNqjaSmAHuswmA9
	hZQBISQILh3+SuzKfEF7/r8wIPFriGimrKr3s7NnRgJiF2x6o+JG+cg/ROcD2RoFmvF4eO69GWD
	SjIWuCN4Y+O7eB
X-Received: by 2002:a05:620a:3711:b0:939:733d:cbe0 with SMTP id af79cd13be357-93f29b48f16mr1277406885a.3.1792417290649;
        Mon, 19 Oct 2026 06:41:30 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:939:733d:cbe0 with SMTP id af79cd13be357-93f29b48f16mr1277401985a.3.1792417290116;
        Mon, 19 Oct 2026 06:41:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:41:08 +0300
Subject: [PATCH 09/10] clk: qcom: cpu-8996: program the MSM8996 Pro droop
 code register
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-fix-clocks-v1-9-370949e4d8a0@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tQn4IpcAQWTKRnzN3rSl5tamncU45CIHNxzgTC015xk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3zmd9/rpIC7E5vdNxjayC4hJDiHYczYV/Pu
 0KRYxNHGruJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd8wAKCRCLPIo+Aiko
 1VNmB/9TDsrqG3/HLtEJoBo+Fm4nbHGNFd0pZdklwHQj7pNjpgowGgKEDa0BH+UlcgwYaVHLjv3
 vS92nxWeED50QIx4+8rlbqUkKKI8N+f0fzBHvdvtOi94qiH6+2HfmKMix+b3GPKmZt4SXFwL3sm
 qNtpWu9olVycpgmhyW28QKTNCJ2ykPiAto/7U+wMI6quZzG0Cg9fvknP1LSvveJDwo8pIJGGA8w
 4D4Q/N4OccglSinz7KWoXwRjFLgg/1HqR3FMz8OCyjKPd63mJU3lYXKhci3qIVSPTBPYg2F5S0a
 mLv75aXCdmLSRlHh8Sc8yOoMaorYU5F0SHWGzLQ/qvqjeHO/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 9-Q2WfpwcEbmgFb6TGrIQremqWiwQqw-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfXzB9G7IXG1nOw
 Sr0SvC+QnZc+epNwfZhmcYmc7gJwrV8H99CNRHIrHjLt9TxxejdG9ZsdTrc8A7gq9uxpy29/BE6
 PERk/rB42+xMRLc9a305EywqG6qkaNQVrnmBGJkDf7ZDDVFUfNUMB0yWlr7Djtzi27CiwuEGTr5
 Hi/IgISzhsaEMmkPkLYOn8vIate/2TulXoYw2hzgnOxtZrrzWAIL+scAaeepw7vZfdQe+7GibYB
 MfbMByzA8CHE74X1X6XwwTZmSA05StHam0Hz+XS0i+SdJ5EkxchGAT3fnmqmJEPQdahDUGiNVj2
 MxDaj2hsoNe96Nqt6M9uQyktnnUVOhWbQH58dfIHOVQm3jtBVd5ZsEtLvoJAsVC7+kBMQ3w5RCd
 7nQsI3Rl7ZK5rz+URmMwjV7pPM3pFgOWII2HKwjzBYj2aHjX7AxMRkjR/kdbYg8BS2sFKqXiTsC
 E2466oSiD0M6YhFFpsw==
X-Proofpoint-GUID: 9-Q2WfpwcEbmgFb6TGrIQremqWiwQqw-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX24NGIpw4De8I
 d3ESS5ANqy1nduQf0zXSnN9xbZZXnnIsPABeBj028BLEZl3D8l9JrS9Mina1Ux31NPe02LUaYqV
 BIilckRaMVM3bvmu8lR+jDOa8Re506c=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad61e0b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=U9F8TDeUCpLtky9u47sA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190054

When the vendor kernel enables ACD on MSM8996 Pro, it also programs the
MDD droop code register of both clusters, so that they switch to the
always-on clock source when entering the D2-D5 low power states and
gate the limits management clock while asleep. This driver enables ACD
on MSM8996 Pro as well, but leaves the register at its reset value.

Program it on MSM8996 Pro before the clusters switch to the ACD leg.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-cpu-8996.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index f22dd80919fa..d428043ecbee 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -56,6 +56,7 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <soc/qcom/kryo-l2-accessors.h>
@@ -80,6 +81,7 @@ enum _pmux_input {
 #define MUX_OFFSET	0x40
 #define CLK_CTL_OFFSET 0x44
 #define CLK_CTL_AUTO_CLK_SEL BIT(8)
+#define MDD_DROOP_CODE_OFFSET	0x7c
 #define ALT_PLL_OFFSET	0x100
 #define SSSCTL_OFFSET 0x160
 #define PSCTL_OFFSET 0x164
@@ -471,6 +473,15 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	/* Ensure write goes through before muxes are switched */
 	udelay(5);
 
+	if (of_device_is_compatible(dev->of_node, "qcom,msm8996pro-apcc")) {
+		/*
+		 * Switch to the always-on source on D2-D5 entry and gate the
+		 * limits management clock in sleep.
+		 */
+		regmap_write(regmap, PWRCL_REG_OFFSET + MDD_DROOP_CODE_OFFSET, 0x3);
+		regmap_write(regmap, PERFCL_REG_OFFSET + MDD_DROOP_CODE_OFFSET, 0x3);
+	}
+
 	qcom_cpu_clk_msm8996_acd_init(regmap);
 
 	/* Pulse swallower and soft-start settings */

-- 
2.47.3

