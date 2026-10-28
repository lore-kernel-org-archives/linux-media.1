Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193867;
	b=wsNzxrtiA3uUdpPTTuUBfsK9wE2CVihxCju87breEcGjXJAzj4RLlBbKN99FYj8dyyvI
	 aX4GHWPmEp+WSMKRWtcwkBEud3OUlljt+OrkTD1j8yquXUR5TDQe19EAkYf5vmpFdoWsh
	 8UjGuHDrap2bhfP6WBFHxfnFOgDNg51Cos8HmOoNUsaWQb/SqbY+iabEIKUSL4DJhDmfL
	 bPBEPtR3U8Y04WhOCdg7pasuLoQ0Wu83pQllUkp2VHVqvSPPA+/a4K4uqeF8DiVz2iBXN
	 0VJ8RbPr6dApibCsC4b1mHo+Zyumgzdmxc5renR+p6M0AfxjIIXMe8vHQWbtOAjFVwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MkvFpAtin74QnzCAAH0IykQRbTDYxYwsIiLg0nxomb8=;
	b=GWn1oceHgZeIiwRekGZFiJWL0c6t5RL+2jTMrn74Qs1DP4NVwrzbE5uf3bMhHho9W/af
	 4yWoV6yccmqm1ecyugKmsso9wYodeElkPZxSOTNlyXsHouqi+BGdrwkqQHfeGs1q9ce2V
	 2wLglL85WqzCV+WhWzsyBhZ/F7OROSf6OP5q4vUanzXQfhAYucJy9KtUVM6SN8HIKLthE
	 RfRZN6FsC+Tk962y3sYU+RCxNXGQ+GzFjFq3q3KXtSjASgJgIbHPD8jnB0jv7OKFcaEZw
	 QZT1tdRtBOJ3dre+kGtQAeafg1dK239e7f/U2tdl32lE/YJslzCqlU24xqYebOGV62g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hjAw/KOT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMa8LWOd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D3606A337
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22D3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hjAw/KOT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMa8LWOd
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2fG4154745
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MkvFpAtin74
	QnzCAAH0IykQRbTDYxYwsIiLg0nxomb8=; b=hjAw/KOTCala2OzsqHDzXHmsLW6
	6Z/uFjD3FTk+NQjLFsqvGJW3rYeR6NDq+wMC3lE9GWpm5dXzlqkk/98546CvRDOE
	g+FsZiX7xJCDpPCOAhp7FvmWpoQt2rtuc/Vb3+MZ3zss3aw2v7LByAu9aHL1ivp6
	azFJJO8muTbrFif/BcmCDGuyZuSFR4wknQLTRSH0VZN+N7Qxfb2xtwCO+kYOcBHm
	9ho0pPGWPtckl21N/+oOv49iE2vh5VEf10UHuhcSoK34QocElZVHxaHUkdeYMw2P
	B5/uloLK/VTlH9cuty/hax2MA7mI+Ra1v+Knfr+UTbly+Idd5PO87fuHQ+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0yp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso414855785a.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193851; x=1793798651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkvFpAtin74QnzCAAH0IykQRbTDYxYwsIiLg0nxomb8=;
        b=jMa8LWOdqLd6/I6OnsPR1wADRNO9bg3rYnJQYSzcouOGw2VyHqbHkWkdas9JazagW9
         GNB3NLeMa86S+tZ7wl6ENzh6a2LNUmx6RDFx668eaV4w+Ct3BeovPxNN+1Mi/QqvGM8M
         TGjMtCki+nc1r5u/7e4uqec53E3lto4jEsJapcYpzEcC2mJpTvZp88Qs8NCuW+2Nezhy
         fH6NnxWoh869lLrF/XuX6KAkMZOXmk7976vb1IL70cDDNCYYuLdWHtf78Bf1NE/pfj38
         M10FiIr85jBfEiyA0mm1GLQroKRBeE2g1W5NYLd5EAM0kJSaRRavL4g/FUp3lnDX1ESa
         hRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193851; x=1793798651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkvFpAtin74QnzCAAH0IykQRbTDYxYwsIiLg0nxomb8=;
        b=Lb29Cen77oTd7eHh8aCeP2fxlygFZn7y7sWpT3RYWtPWzjQsVTHe5v4eYF6onFK9P0
         StK2ozQdFOdvfmx3PUTKVdKXB4eV1wkhEW6uwNqkAXMpGmaP/Bu3ODLSb2GmUWF3jYGP
         LZyvb7YxK572BnDzig8G1l3w9uiIUneQSUfgFppeqfcihe7DWEeUGy7MYx5f4doY7blp
         B13gOcFTq+ip7cplJajIcBWsZ22DI3YdHM+VbGD5lEXlhKgYgWENpulHMnGe1gEl0AwB
         5ByPh06onYyBh1zOK0/UC6irk2XtiJrRh30sv0j29l2fChz6vX9S1Y4lxDcwiLRWUEvj
         DaMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwySNsVuZcTIDDc2ajqKP1lLAOMQ/xp6d6u2rhbmIhGgUdmP9HsxiRrqZox/m0ZuSv/I3v1cAYRRA0kvQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLtnKZXIhoNmAfqpQ6iiZSyWfQUFYnZgnHjzzn24xr3xN7iGd/f
	jWZ5fhcN1T0VflrrIZQW9SkkXYEtGvVyrjXs04Ur2Avd5UdVagA6HsRC/E4Cw/iQm+X+ze5/GZc
	sQ2m7h9zZvkIT6bhH/ZK7Y6dq7CrUs6XpniKBaozAmzHNOgvvbfenn5eS7N15ooAuEA==
X-Gm-Gg: AYBFou1KHo4azb2kiY1FxCDWmoYiqFImWWxJC7JO3fvKCr389mdkYyD3btctXO0+uaP
	VbmjOJoqAJRmz6f1e/CTa7u6iynktTviwIdjjmO9R2nWeynmJQHqDN7PQBPrs0m/SDdI2XMRuhI
	KOpBV19HHVDn56HVH2Q4EOxSwJdge58TnJQxkUF5RISlpp52iSV4Od8g8kXkAzzdLdLmR80xMnk
	Ccgv9tExOHvWhlaYDUgRlbolWlsri4Tv9aOv5co0fco8PQS0w0uyv7J0y4kQPppGp3RuQoxj0I/
	qfLmQJrRsrfi4c49kbNKEOfUOS8oZLYllwSS1/j9d0EH1Ut1l9rd3Df7Rst+9byyum23nfXfje9
	q1kWU0+aY0I0qbhws4nz+oGS2ajz2TgM1UNNrhD3T4Ko4UJxwIgl2i5CrqtsUgDUHCzXE3fyYyw
	==
X-Received: by 2002:a05:620a:3904:b0:93f:31f0:6a77 with SMTP id af79cd13be357-943f4b3d96dmr930533685a.11.1793193851149;
        Wed, 28 Oct 2026 06:24:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:31f0:6a77 with SMTP id af79cd13be357-943f4b3d96dmr930528885a.11.1793193850586;
        Wed, 28 Oct 2026 06:24:10 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:09 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Wed, 28 Oct 2026 15:23:59 +0200
Message-Id: <20261028132403.3505037-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FjsCGtqzTLBaELzmoBMcN5vPsCYSiSKS
X-Proofpoint-ORIG-GUID: FjsCGtqzTLBaELzmoBMcN5vPsCYSiSKS
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1f77b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=-HOgthFiqlNClzdobJoA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX8Ed2JPkV4026
 95zP49R7UL8zOCvw97JyXANQPPck+7jAGigq1+MtRjpMywujdC81y6H7jiqucKGeP/qLAjq+455
 tikR1svzFbAg9BCiTxH8uWdC53AXDMeqdH3QtKKzvU5JiHa0yxRdpgW0rAJ0t87XbYLnUR6ueC3
 qhm5KxkGOAqi0zH23vI89XaywpVGZXX9SJ+83Jf2T95qL8gfCNEMGAaTMzbJkZpbHct07BnijJ3
 HgCMInTLy5KSvtWywaIaI1xzzFv+/gm11+MdT6j3ZEC+Ago80q5ZtGMLQt2/dcTJ+rA7mTDU8bt
 kSgWU5+UEAaKol9sCLFHUC/5WyVcE7bPc4ZFKXTbfXFW8Uc+5IFHplGxQS0zf9DEssPl5ZJM/Gt
 5+BhNATb2j+AMZOHGHHI1/P7oLjtbguGYj7vqiX/1Nq7l3uO2E/uxNas9fQT45/+XyZ/W6lOuHm
 CeJrBi0FIaXPgVJqXvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX2lNc2xdwY44R
 RTuvNkBHX6TUfl2MVazPf086OJ61JRTVy8kvXVoD9unte275NURw5eKcJScVcjpewWxL0goi+qD
 TLGSMQQHnY9p4leAJPCOxyXCDXr87a0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280053

The VFE fails to power on when the pixel rate exceeds the highest rate
listed for any of its clocks. The rate tables of the VFE clocks are
independent and need not have the same number of levels, so a clock
with a lower top rate than the VFE core clock, such as the SC7280
camnoc_axi clock, makes the VFE reject pixel rates the core clock
still supports.

Keep failing when the pixel rate exceeds the highest rate of the VFE
core clock, and clamp the other VFE clocks to their highest listed
rate instead. Take the clamp into account for the other clocks when
another line powers on an already running VFE, so that a clock
running at its highest rate does not reject the request.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
Changes in v4:
- Keep -EINVAL for the VFE core clock, clamp only the other clocks,
  drop the warning (Bryan O'Donoghue, Loic Poulain)
- Dropped Reviewed-by due to changes

 drivers/media/platform/qcom/camss/camss-vfe.c | 40 +++++++++++++++++--
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 59be37f83df3..bcc2c1929af1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -918,6 +918,20 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 		!strcmp(clock->name, "camnoc_rt_axi"));
 }
 
+static bool vfe_match_core_clock_name(struct vfe_device *vfe,
+				      struct camss_clock *clock)
+{
+	char vfe_name[7]; /* vfeXXX\0 */
+	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
+
+	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
+	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+
+	return (!strcmp(clock->name, vfe_name) ||
+		!strcmp(clock->name, vfe_lite_name) ||
+		!strcmp(clock->name, "vfe_lite"));
+}
+
 /*
  * vfe_check_clock_levels - Calculate and set clock rates on VFE module
  * @clock: clocks data
@@ -1001,9 +1015,14 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 					break;
 
 			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for VFE");
-				return -EINVAL;
+				if (vfe_match_core_clock_name(vfe, clock)) {
+					dev_err(dev,
+						"Pixel clock is too high for VFE");
+					return -EINVAL;
+				}
+
+				/* Other clocks are clamped to their highest rate */
+				j = clock->nfreqs - 1;
 			}
 
 			/* if sensor pixel clock is not available */
@@ -1045,10 +1064,23 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 		struct camss_clock *clock = &vfe->clock[i];
 
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
+			u64 req_rate = min_rate;
 			unsigned long rate;
 
+			if (!vfe_match_core_clock_name(vfe, clock)) {
+				long max_rate;
+
+				/* A clock already at its highest rate cannot go higher */
+				max_rate = clk_round_rate(clock->clk,
+							  clock->freq[clock->nfreqs - 1]);
+				if (max_rate < 0)
+					return max_rate;
+
+				req_rate = min_t(u64, min_rate, max_rate);
+			}
+
 			rate = clk_get_rate(clock->clk);
-			if (rate < min_rate)
+			if (rate < req_rate)
 				return -EBUSY;
 		}
 	}
-- 
2.34.1

