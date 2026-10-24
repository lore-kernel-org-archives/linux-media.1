Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834839;
	b=Tc/MNo+rrrsfHDtSV3nrDUjiEu9W5/sE0QzdfqdOggC8Af3rxPUJYGGrKSaa0o4mZFBt
	 2Ak4CT+BHFylPYN4fz12CdVsv8j3ko6f0+cNd+kTYzhBb+OeuMHckwhNbax2XP6IrizYT
	 D5nsaV7j0gkYb6VGD/Dim0o5vIMTP8OEeZyxHoqX+9CokhOaPTADd0s06PpIqjf+TZyyY
	 8DDWr2UgWKJ7fhjo2bEadUH7sTSA/maKvVWulPiIt1uzWtl2tVWdorGuSOSIVS1DRfKce
	 iU48UX8d2F7/aq5WJq6mFOElFmXqziY4hgj0mYG40FGzGyNKRqsnFFGIkdb3f1XknRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VFR0fSKAuE9J983F3nR4TA6iu8SbAHob6dRDH8URmk0=;
	b=doo2UDtw5oZEbsGrQDTIbzYQ9wYEWkt8WGAGRIHTiT/FSq/X9tAyDF76pNj1wBRZjc7p
	 N92+04idWaV9OeTktptpJm/R9rftRsRolOCHoIWtn8ePmv4SC8/uEDVSrZfkgi5a+30ZT
	 3/afOGEHfff1wFGoHGUuAh0Rb42QGWurlkS9HUHW6jUIZ7E94GHms5vrHIujtIJrw5b43
	 yw0rKxUQ8TWG8D5g90lviSbQHo6cVig44ZLDZ9H/0J9HTg1NnytJuLt8O9GFD35pN5EFs
	 4NWYHbL3ygNra1x+y6h0SE5Jh6Y3C7QHd0ZxX9OVpOle9j6fFyp4Jt0AO2/EhI9l8Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDHzIRV8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XhumLcag;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A81606A33A
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A81606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDHzIRV8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XhumLcag
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8oDWi2217379
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VFR0fSKAuE9
	J983F3nR4TA6iu8SbAHob6dRDH8URmk0=; b=BDHzIRV8Nl945kBJzWzGbvomScP
	42XGP4nwOfKlRLUnwg87UZzWYGNWIIyozxHhg79EkotB0ccuDymnqDGUQJiPR5Lv
	aky+Arp0o/Si3EDFG/LNOv2QnPEKnSwKtIQzR0KAfUq8kw9uP93/5e3/UEUH9Pbf
	ZDNhAbIHH7hDUsXJIG1GZA9R6wIdBQD0GbA3HvZihWwFDLypeuFnkOAY9I6oTtQc
	SKxIqRnjG/y8rvnL8GOYNuBUciiVHt8TltW5jLTGYXYfEKP0ScV6ynXgAm3LY9zs
	Bhpd9CP6owwq+gk75SgiLCID2rJOkQJ9z7gYlFhrBxC4HgyZF+QWW7tnbhw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgry7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363763b556so35057071cf.3
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 02:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792834836; x=1793439636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VFR0fSKAuE9J983F3nR4TA6iu8SbAHob6dRDH8URmk0=;
        b=XhumLcag/Q7fCV3OTh64bhU5hQJSpO9cPLehtkK8TwE/aycUIXQdxl96IgRcCzDVpf
         zsjtFZAFiiZGclWJQoGpbv2gtYybekERsECX8jjr9a4KqR9NdXOYUbCKuTqF5Y671tf7
         OGREqn+wLIBJrr3Dyj7PWFnjZCkQK0HKq+GROw4DPRV/QZeie1C1lKda2HjQjMJlhAX9
         +4x0RgRsopuylMyAR0kfI0r7IkGhlme5KCHO0Sa3vGUgL3b3epjuzY70yh7PMnInP7sY
         F5xOytPFeLGNEclFiQaHYxi7GqriAtrmUwO3KiFCiCvd1FG87oJ27WoGNLrDJPIBtYss
         +Kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834836; x=1793439636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VFR0fSKAuE9J983F3nR4TA6iu8SbAHob6dRDH8URmk0=;
        b=Ya7YS5kDEa44MhRFu1w0NbakIZAsRRdQlvPdcSLAX2suJlZWDwt6ITp4DcFx4aMmsh
         e6cJqM5LerSZ82uBcDLkRVIhU8kg4QhhgPQTcsGxTuANqXILUD/c8zNOErHgbENy46Po
         HGSapjBOwqb2pzfkSqYqrYA8B11KgEvR4dsoE1s5cqmCVtJVf/O5RVH35wVTxXdxkTeC
         gVqOigPS0YoC4dIBBva0ikteeWKngczIH5pDxvWPrTDdhKjhQjKTdC5FdYBrjgPFuxtY
         B0kwcoZft4bLmld+JsjojOfmK+QUu3dhnj7L3fEXDmJ4j/rIFQbsChj+Dd+8yo2Zt12v
         q+cQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/vatCoYJXjrSJXyjIrZ1pq+7sA43kX82gXy7taMZfaBnjmCxfN6fPU6W0/s0I2Qe1i5jfsMTloe0G2A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJnQ/4iVUS1HjCfkm28+g9cUJNZVftlVZ2xbozsxMl9GcqJC8eD
	VVpcy3c8sCPvHl9cnEQurRAo29jgRZ/XfMW7WOucXjgfA3c/DHwXo5nPTclrBUx5/rjlelvaCDS
	7Qjs7BGfzpoJ/QckCjRa9vUuBXtXWiEnavhdnBjEluGOHt6Hnag/vf4DKFxoUX9Hl2Q==
X-Gm-Gg: AYBFou1ofZm+HzWZmzzpmjxDDaw8MwAGcTDL5It6xZR4cmZQUYUNtSLirIbIsdpRj4C
	k8fEfRZTla1LbSGTFlu5SHnYg6z5n4BBczNgU7WfrjLlPiowtweNUWuB4hxsuQHI06ppsrG9eeg
	UVGag2vaLRYaL7zVICxUZZyRuevRKqcbEM74Mu/kvDtE9mxutAbPCNje/YpA31q9Xt+SpMNrd8G
	68jVnbrw0Z60wf/uaj09JiLDvzwbul8qEUHKAluN5deWB9fEtHA4gNMYqqQ1M5BSi1h3YbD5fId
	rE+By4npitnzX93BK40BJCBWDblmjfydFHpQ1BIe0rThgIu24q3pSrdqJJabdEYzWy0iyvzUn2/
	U14AGTmc8TsO8GyN8RNP6FJOx
X-Received: by 2002:a05:622a:2a0b:b0:536:55c7:a1d7 with SMTP id d75a77b69052e-5383b5992a2mr17141071cf.54.1792834836404;
        Sat, 24 Oct 2026 02:40:36 -0700 (PDT)
X-Received: by 2002:a05:622a:2a0b:b0:536:55c7:a1d7 with SMTP id d75a77b69052e-5383b5992a2mr17140841cf.54.1792834835969;
        Sat, 24 Oct 2026 02:40:35 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm2857166f8f.13.2026.10.24.02.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:40:33 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Sat, 24 Oct 2026 12:40:23 +0300
Message-Id: <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfXwDQOE74otrnO
 qhqDKbvUIej+EOyas0H+mxGLCIuzv8saWKkRMzyOcPopBLh6+0KzyYJvEjv5vRpvAFE1TSd1nf0
 i18hdVIavqGuc6P7qkCrbdm501Chz/A=
X-Proofpoint-GUID: tPpGIXNxqPuYNGDwdJ8V1itei0WevJxh
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6adc7d15 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yH3Gd9U0UaHnWrszFSEA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX4xZbLqHwR9OT
 0kPzenxRtEvA/gbDLNSrDDIi/97MBPJhMJGq310CkohbUYn8siKLzKOJJXg9Mvsk4nz2p0tETm7
 +2FsOWkfnQMAz5CrRIp0BxQGaxOV+0rtDvAeQU27q5Ruo2LnIhvPH4BP0ChipbjQJJQlz7Mx0VP
 7NNmOPbUBwqmT18Z2gJ6XAU1+4w2dpF+n7DKJlk7DiJ3uuxHncREpjXCS7QdB5GA6oW8uxHuPH3
 i7iwx61DjrvnVwFHHXm8QV9bAu0oysrlRbS1CHRB5wbQMnkx7RTyV0q8+WU1C/LfA3HaYjCYraf
 8eQML/i1KX4R0ZUH/HbmG/S1FKpFoShGpDAX0VasLX27V1Wv4cdUJ2ZBXUo4ASpJvzNUIipjCOn
 zz2KSKSZXiQwsJwbt/QwWeujsQRne8EeIbXMv4eWOTzjhO5kAA/oPICKqKjbib0XzkfqSv0YVJG
 ch5KPdU0J8aSIaIApEQ==
X-Proofpoint-ORIG-GUID: tPpGIXNxqPuYNGDwdJ8V1itei0WevJxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240038

The VFE fails to power on when the pixel rate exceeds the highest rate
listed for any of its clocks. The rate tables of the VFE clocks are
independent and need not have the same number of levels, so a clock
with a lower top rate than the VFE core clock, such as the SC7280
camnoc_axi clock, makes the VFE reject pixel rates the core clock
still supports.

Clamp each clock to its highest listed rate instead, and warn that the
pixel rate exceeds it when the clock lists more than one rate. Take the
clamp into account when another line powers on an already running VFE,
so that a clock running at its highest rate does not reject the
request.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 59be37f83df3..359b5942df89 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -996,15 +996,13 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
 			long rate;
 
-			for (j = 0; j < clock->nfreqs; j++)
+			for (j = 0; j < clock->nfreqs - 1; j++)
 				if (min_rate < clock->freq[j])
 					break;
 
-			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for VFE");
-				return -EINVAL;
-			}
+			if (clock->nfreqs > 1 && min_rate >= clock->freq[j])
+				dev_warn(dev, "Pixel clock is too high for VFE clock %s\n",
+					 clock->name);
 
 			/* if sensor pixel clock is not available */
 			/* set highest possible VFE clock rate */
@@ -1046,9 +1044,15 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
 			unsigned long rate;
+			long max_rate;
+
+			/* A clock already at its highest rate cannot go higher */
+			max_rate = clk_round_rate(clock->clk, clock->freq[clock->nfreqs - 1]);
+			if (max_rate < 0)
+				return max_rate;
 
 			rate = clk_get_rate(clock->clk);
-			if (rate < min_rate)
+			if (rate < min_t(u64, min_rate, max_rate))
 				return -EBUSY;
 		}
 	}
-- 
2.34.1

