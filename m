Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538865;
	b=No58qaii0uJN69/AUQ6YFm4mv6BXMcxqPQfCjCds9Mpkb3HFj5Jk3Z4zu0+QJNPnOhcf
	 dfRUfWR9IKHcRqFajaQ7xTY4L72Z5Gpu9TUC1QQ/7XZ6XxTQ436ICi9NrWopG9e6qXuNd
	 pDrsfC6OSdZeiD7Ix+s4hq33Gm4TUB5dzzsWof56A9VaAPH8bWqxEgLjYG8Bc5Z+1FARj
	 yq1H1xCKKfHwJN1TeYULwpRKAbmBnbKOpBYfwIY6qZdQP87z60P/Rqdqi6ncmhWLbDPKY
	 juD/EzN1FL9sFkd/dE9lL5CTRMFNA9UBH5kOWssOZE/DVnWwul6L3BVh/StYq7kXIlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YI2Pi0bf2VXziHd9nCnIqr+RJXPsJbpEZS48qqU/M9I=;
	b=W5uYo0pNRKT3sutmpkCqvpCYgcnrgQjbBfQdqQR16+Uea62bh4L3wDKpXvdyuXFCFqFN
	 Vf+kBjDmQEY/0GkgPY3WgeaQU3OFHaV8aHL61Ca0rnpVOm6d5pFjsK82kJdgsooRz2Dmx
	 HbacAhb8iF+T/LTDHNdI/cNJtGSY1Ym3hZARMGhTvlZ6llilmvGCyGTq5me2F+XP9LPKr
	 rJbMg8dufsGi4O2rUQZbYq9CVROr6KoijcZxfrlEo17Qs15JpuDD7nNc3FRLMEHSCuzKJ
	 j0/xTzOrLPovBHRi53p2bNnxF1t7l3X7slpdczQQdHmEQijqaDH6SAcI5h5YDPsoxdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvyLtVTY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fnbRXIFK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2710606A331
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2710606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvyLtVTY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fnbRXIFK
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLKwV3267089
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YI2Pi0bf2VXziHd9nCnIqr
	+RJXPsJbpEZS48qqU/M9I=; b=pvyLtVTYOW6CSP6yIyKydVhgEQP3GT8A49tkXl
	KNDArmreqXAx8bzesLWr/X5H4Q4DBxakMiYdniMBPQTfoFGT6+beNXWxR45F5IZg
	zE9oSixSebWMJaC3p9YrZtro36NpICKGEvEQMv2cuZywyc1SFEVdXr6k1JaMNV5J
	wLPrc9JP/fLipuS4KoXMOYQRfWYRfXQdXeMrRgPtyyxau3/SG8Nz4EvgWtyipsuT
	zL9FDXZqdA22DYV4SCPFltUOGOLDFc6dTmJND/ZrYtly3ZOraVeoZPEuBLZ7xBxB
	FgqDkXbIXRohCHfLChs/7y3H7IMxRId+ZsHbL7790Tvkz5wQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7s8am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:47:43 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836caf085e0so63241047b3.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 08:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538863; x=1796143663; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YI2Pi0bf2VXziHd9nCnIqr+RJXPsJbpEZS48qqU/M9I=;
        b=fnbRXIFK2AsLbZ+Kqok37o+40ilAd2YqDnyqU/EEL72y5DQO7JrKllwvfFxxs+WcPF
         TPtzn7I36ZnANAKEuBvk9dciojK2moBGkhBGmvfzBvjjpJlpkIzwyjvyJRVhXLC4Wtun
         n/TomkLROklz+pTA7wKZQPHH4QegBZcHuvMX6MMdjEtNc+xMX4Kh0u1UzMMPnwTjiTT2
         UxQWhOuxXqMv1PATOZ1jke2UZnDPtwik6mc6WJ9fdQ2KrZtTP/6k193fVp7SyXIUfUhc
         AeUYXOtSs+/lQuxXCWtywmOVKq8a/vgdEMX6r/tjUz4ksMUPKlJ2R7LaTy5WNHCbvXCP
         tdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538863; x=1796143663;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YI2Pi0bf2VXziHd9nCnIqr+RJXPsJbpEZS48qqU/M9I=;
        b=1mF1jbx1p3AHBRrvFiq/Ez5TOw581+e4GONqskrIVWCbSr6Bcyr9G6wILvavRWHdfz
         oGaTJ65TmNDIDt/LEURYbK4puwhdDYk5CmyRb080qQOObsLJ13Dj4REUQRCVraQBBV5d
         cZnduQhLoID1y9nOh0nDA9PyZxjlUiMv1Ywo3fpGhZpFdrWXGSfYmB+17LN4qjo1oSKF
         gZ3N0tfI/KhsIJ5A+cnYEIww6PQBb090U41gVbn+DtIP1d8j7v82MGiZHO0qMR1mk7w2
         vFX1VmEX7n/Ye1Kwfinb61HUWlKfDvblOXdw02PJQP42Rpbisck2HU+ovSbk+v27qYyY
         L4SQ==
X-Gm-Message-State: APuU4Z+z6EcAAu54Dnx7k3D+/G0BcIkeBCErmJN9/nNbXTXkt2XDZGh4
	9ZAyJQl1c5NMazQaYAUz+jiIWXhdk600tEHW9QAblATBAzhKVZyemkoR4E8pInz0rYzvAuI0CSp
	+9CSI5iil9dEekcSdtLPMwpgFLOgiNb5Y9hG8OdJhXBMxEYEizutO8gTncg58ceUSyg==
X-Gm-Gg: AZFdTZdF1jECmKZKA3TIBfzIWtuWs7CJPPdtdWokqDmFL9F3e27JhNwcQcnsaMzRXUF
	uSBkVEVpn19eARvCHWv78SDobk7XMhzUUmawJ2PmTcw4TiJ7lAImWZ4GD4N5E9MMd76hIMYbADA
	0UXh5kvbk7J/+Q9cObRKVqMlsWGF19M9Gm4SIcW+snoMk5BNug0gmLIZITIO992gK+5sP0nvEEn
	u9fkQ2ZA98JkU3iv40MtjTqrhtGgAq0AItSRb6giwHuQKpEew2pYz9HfkPagSqm46O8Qjr8aQ0c
	ilz9W6Q6SPBHMfS1DLzKuLwjQzLLgQ8fpYGO9n8Q123+ML9uIHwvNKjA3NZaHxsRO/FzFro0K3I
	81CJJpPNxKuMC3SrIAiyd0etTByLBTrPB+zgEFnH9KFivbPw3TToxN54nYz23olWcVQJhKAaCSA
	dCXhhkE2Qd8WiN41UB4oLN2pjgxyU7PctfBstLU9L1b8oz0kItDIoFt3LQMycNu8m83UDHgwj3Z
	+qmAGeITkNsMb9AIz05wEDvdxix
X-Received: by 2002:a05:690c:b18:b0:8b4:e51a:c4f7 with SMTP id 00721157ae682-8b52051967amr66012667b3.60.1795538862847;
        Tue, 24 Nov 2026 08:47:42 -0800 (PST)
X-Received: by 2002:a05:690c:b18:b0:8b4:e51a:c4f7 with SMTP id 00721157ae682-8b52051967amr66012517b3.60.1795538862213;
        Tue, 24 Nov 2026 08:47:42 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm29388605f8f.5.2026.11.24.08.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:47:41 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/2] media: qcom: camss: Avoid useless RUP_DONE interrupts
 on TFE
Date: Tue, 24 Nov 2026 17:47:37 +0100
Message-Id: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKm/BWsC/x2MQQqAIBAAvyJ7biEtKvtKdLBcay9WGhGIf086D
 sNMgkiBKcIoEgR6OPLhC8hKwLobvxGyLQyqVp2UqsXbETp+kcOFtAzOKt30WhooxRmoqP82zTl
 /jxMyg10AAAA=
X-Change-ID: 20261124-tfe-fix-irq-eb8fd293791a
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX9VU+gI9sSpXd
 R8HG8bpbe8zmYjOUDwubo3r1pc0iy1/SRkwy/foiIg2yOyMG8Jcd0dvxOaLMVAPh+KMnNckRvgf
 S/z31UQrxoFJUDaR8BZQRtInWcIhjXI=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05bfaf cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=f2WnHwzxnJiq5ND5xQwA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX1FW303cl/M10
 Ub71XDL55on4wo544KiIMrhd3NQMaNREZsM4r1dhwTMcBSc5DlCLqb79MwHyBIYeWxdc2dkeKbW
 W8D+LFGrC8lrFH0TYLgtBqhh1lGSHvjK3Uj4QcJ/coLpCpBVLhgaQRMWeDcXr1RgYgGOFSv6GFQ
 n1mLwyKF8OKSX6jgR/6mkWHWi/a5ijGnGLbjqDxfkDfhtZI1q7gycgooo276werQy6HGzIeyFbh
 KkuPKGC5f2U0Q6owLTVv1wOiFoDi5XtVE3CuIASPQXp53GBpyZu5cq0l8WMQaHVTfPg37XAlY9C
 +O3YClCqvmYpJy5crKDsBWo66MDM9vpck3Ugi47dct43KpDG+w2MOfqWmL7UBZj8u4eJUZQviO2
 CL0nC5HIsjaMYg+R9fIUiUqARMuv0mfeR6e4Zbwt3Xl5oT83WKOf5D8HkQo+pAIQi8ig4k/hUpw
 IyanMZzLc5dfgd3vWEg==
X-Proofpoint-ORIG-GUID: syEqXGMq11q4m2tLwkojJIycO1QtDoxT
X-Proofpoint-GUID: syEqXGMq11q4m2tLwkojJIycO1QtDoxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240065

On the TFE (VFE 340), every buffer queued at runtime is followed by a
register update, which makes the hardware raise a RUP_DONE interrupt on
top of the BUF_DONE one. We therefore take two interrupts per frame where
one would do.

That register update is pointless here: the TFE bus image address
register is a FIFO and not a shadow register, so the address written by
vfe_wm_update() is picked up by the hardware on its own and needs no
latching.

The first patch replaces the sequences open-coded at the three call sites
with a single helper, which calls addr_update() when the generation
provides one and falls back to reg_update() otherwise, all generations
implementing the latter. The second one implements addr_update() as a
no-op for VFE 340, which removes the per-buffer register update and gets
the TFE down to a single interrupt per frame.

Side effect:
VFE 1080 loses the register update that used to follow each address
update at runtime. __csid_addr_update() already writes the AUP mask and
then the RUP_SET trigger, so the latch should be complete without it,
but a confirmation from someone with 1080 hardware would be welcome.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (2):
      media: qcom: camss: Latch buffer addresses through a single helper
      media: qcom: camss: vfe-340: Skip the register update when queuing a buffer

 drivers/media/platform/qcom/camss/camss-vfe-340.c |  6 +++++
 drivers/media/platform/qcom/camss/camss-vfe.c     | 33 +++++++++++++++++------
 2 files changed, 31 insertions(+), 8 deletions(-)
---
base-commit: 2ad58ca589da80990b7afbcff018777851577f89
change-id: 20261124-tfe-fix-irq-eb8fd293791a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

