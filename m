Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433772;
	b=r9OH9ghxVm7tVSGAW2f6DEDwwGf8vw6UUVvrbZstZ509Ri48p3TEEW8HGkF9sfcirumL
	 kvAb3zE+F3Cp5N+Jtj4aZAOStO8rbf/RYYJaxFYswCrv1AZMGoZBBryHxx84QZcynAWQO
	 UNqZPz8njFLKBFW4t5QBQYoItncEFyz1XKhaCL0L63GgL1JaAy8WcU5xGMg35Dq/jENlY
	 LicjrUJ0Axf3vmWaV4SFQywmkH6amcw0VPQZr70SVxaH3CFTrIazxrABu6Dchzo4545PL
	 yKmIr4uPbHX6R86MvMdFl1DieufTxYd4KqhGJthCyfM1MK2yCZiJDnb4bC702+VSk6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kvf1DqFBV/lYSc3QlXJzJuXexwpm5K3ANgpze4xoM4c=;
	b=hiuH5n0UB0LSYNs5Jw7h3rNVk3wyJ87GwtOpgTZgibIsJZcxve7t6tjWheHxN+RaOkli
	 wIFQ/FhbnwupV38Nd5DGwfue24cQrZGUYj26oLJveFHAeT2AA5Xx61j9rO6orzi+bn52M
	 uBCfKAUMQ416w32TVOa7igl3moW3e/4ALhx1uT1hQmJPNgLwOzvcsCm27I0sSQP+R17Lu
	 tSI5Y6uw8kMu52WXVcIRRPNHxJ1NpqW9QFQU3plgdCq16nBoA5wj51h/BJC5xAdxUkiFB
	 K3TxnEzd7vzr9ANcRM66LPOhpU32XVyiknAlsuYIgUD5Sv8DIFKBisrt9UYasC7jP/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2cTu1ho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHvyILew;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A6E606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A6E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2cTu1ho;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHvyILew
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G7Ij4095711
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kvf1DqFBV/lYSc3QlXJzJu
	Xexwpm5K3ANgpze4xoM4c=; b=f2cTu1hoW8g4gc2nA2KmEj7+fu4Rcv6msPJOZj
	pWfS3GBSDt57U4QgesVu2y+y7tr/1vpP9mlzE5dMRgcDztNroAjd2TSs8gOmA3Lm
	05x5pXTTtAgW6A6fxy/dWrhJSOIUmYjq4N4N0X/NcUhzA1Hk48vbNEhPAuX8hOz2
	aBwZaWoVmfGX1+xkQrb5bXKDBqkjOYKzfcMkDochqvhM8g7JEif3WbyzyzAdp5ei
	L8r4dxJFAv6U1K6P3QhxtCOshymmjgt51clBV46KQtDgvbrBid8n6m1lwt6YDS8s
	ibAiJHeOOkGhQK0ORFSAnUcZoSLBgIA7QuOBIwTgUpxEYa5A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g74162j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:36:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b4162e1605so3172754a91.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 03:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795433770; x=1796038570; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kvf1DqFBV/lYSc3QlXJzJuXexwpm5K3ANgpze4xoM4c=;
        b=WHvyILewrcips1cDH7vbJ3lUf7LorMQ1n/k7wtjsBgOEa2SgQzFszKGCHZX38OoGQj
         POEKLJC9zfXQLXkuMG0B4X2NflTWFT8NTNjbdt26KXTafzG760Cwyx6zOv0MgJDgQ9/8
         5MD8iRbc04aiE/bj2U7suNuA1ooXIdnVoBwIpWO/hsDaaBq5fRlGOus1VdrG7cRhYz3e
         HxPSgEjMYP/IJhQbJmzdVrAuAXzbMYg8RtOd1wMYqi992ECyT9nG8RfPdykTyJkhuaP1
         7jhEJ2XSThDthPjW8KqWTE/2yDorwJ31rzXeDzDFdZ5fXSb9naC91oC7UxWzlhbtK0S7
         +5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433770; x=1796038570;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kvf1DqFBV/lYSc3QlXJzJuXexwpm5K3ANgpze4xoM4c=;
        b=P5kWbO1y6wSvFd/29u9rZQ4kBUZa04S89JGfAtx6AviJlwV1sKRjhNGSmpsRZoZmhQ
         w/Q6V02zi5d3Yxl+pZ/chglgrjVms5PA8FzscxTubUf0kE2Cv/IBrJHx4NyTVUOfOV8K
         Be5STKPHlo4wGrFxwpapoFJGtHkQrJymuvz6mCdR58PiHV8vROY6ZwTWrHVHSm9eAScN
         cgONeCMFMN6l/vfajdy1/lMi0VFc/lZ8+pvrQKafdX0POaNL4FKiCAoFeo/TKaAk1iQs
         qHmpvmYf4ICp9aAh2B0ZUKq4U1yOMkrwku/Z7LMEBK/rlLM7f4PJ5aqiX7P88n8Os34E
         hBtw==
X-Forwarded-Encrypted: i=1; AL+hErFEbwe4x83aEJwR0yyVvYT+Jf8dRs8YeG8WmH7WdVL46B4YT7YJvkpJ9kUayqB4GWT3fuiI06j1ZQOQGg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+k+u0BxGBVDTksrnCS8PmbuwPXKLPDdUdSZdIo05itJb7J9HJU
	u0JZTmpm76OLnmljGywzWHTtVQSDqJLCZipmkGRQ713GuLNg18KyORO7EJdB+Qmc8K3it8LAwlh
	hGtsgTccI/jKDTO5gluUnvYjGE2MSAfeeqFJpO89fTl9hmafdxRuGitbXeLAInAnpaQ==
X-Gm-Gg: AZFdTZdD0VhRFaVZ10SrHEuVpQ7YV4l4H/q+KW1qVn2HJYYZwktLKOAs1D1ZPNokQrB
	jMRN/7wM0nC5o7DY+y5zqRwhWEziSlbmDJaNpO6GSACRpALlDb1670WOO8fNp+umUJ3GvjcjCUV
	0PHQv8ONjoQPc/D1RwYqZBpUXpZuv39Y4ncD9XvUluG/bnY+WDYjkuhraIlb0Kzc/eixBr88wx1
	w2YltXwsnuynrK6TaKPhRTooD3Xyju/CVtysQIZdzf1AIgPZoM6K0XEsYYFbozPHclQ6mJV4SD1
	d2q2O6M2+4k+igUFqrRz41/d2wf/Hv7CnmYF6JOh4LkxDrRy8tte1cqlIzpx+7EpSCHuS7Giyix
	EW3Oki7hMd+GDeJUuYlQRepD6dhZuEnmy/iLFpqr7oSJF1RbziZbO6s7eMOlaUufgxCzzc5so6r
	4RS/dl
X-Received: by 2002:a17:90b:2d8a:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3b41c92ce58mr10129791a91.25.1795433770193;
        Mon, 23 Nov 2026 03:36:10 -0800 (PST)
X-Received: by 2002:a17:90b:2d8a:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3b41c92ce58mr10129770a91.25.1795433769726;
        Mon, 23 Nov 2026 03:36:09 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm17489024a91.11.2026.11.23.03.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:36:09 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v4 0/2] media: qcom: camss: Fix Glymur CSIPHY topology
Date: Mon, 23 Nov 2026 17:05:58 +0530
Message-Id: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAB4lBGsC/3XOTWrDMBAF4KsYraug0W+UVe9RSpGmo0QQx41km
 4bgu1dxNiGkm4E3MN+8K6tUMlW2666s0JxrHk4t6LeO4SGc9sTzd8tMCmkBhOT746WfyheGvlY
 OmLYq6aC1S6yd/BRK+XflPj7vudB5aup4X7IYKnEc+j6Pu84LT8kFH5RIAZQn68kYQ8oKa7ciG
 cTgnLTsZh1yHYdyWZvOsGKvS83ABU8YLfiEToF/H2rdnKdwvP3dtLF6s3wwQD0ZshkRorNGeHR
 a/2OoR8M/GaoZDkL01qIGfNVjWZY/9npnJIMBAAA=
X-Change-ID: 20261102-glymur_camss-1cf83f4a447f
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795433764; l=1935;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=8yFIvWAABarJ0JyJs13EEogwta+ICFjTnQS8FxrfjGY=;
 b=0whS6kx5agoifZd4Hi3g5c1l2aKyklENAVvviS1Ua/4nBS+idtPpWP+TpLYe7U5bN9PeDuASC
 pzfCoAjkGS0DB8GqvdYjBCbJy38VfUNfDGEQUDk9YkXnErqt2ZZq2D+
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: cANbs1gWylqCgmPEaxV1aMd6Okpnc2qV
X-Proofpoint-ORIG-GUID: cANbs1gWylqCgmPEaxV1aMd6Okpnc2qV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfX7mIQYFIKBtNx
 yotnxn251d+qWzv7f0Pl9t+XljyA4ldX8TKlLFQhDdbv4unIiLs/H0imh0Oip22Fn/qvhLx1SYE
 IY5IIBi/QLbdQhlYXdUG/pbmVKOPMco=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04252b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ffzozp4-zBr36aKF_PUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfX3DwAb+okEjUh
 gFqaIuYR4rgWNRAH9nscvzIBeejBtrStoCZTdadJYKCMoqYRmYfD9er5fvwFEqKYnpW7kjK6hTf
 +hJT1IqP+AXh+ke2vzdDUCgrCa4Q3ozJDXKXoRSuNCdTNJob3oKyRKRzlcgwNf0nRxAqAAtjRfT
 c45ka54x00VrytzLZY17WsRx0KDNDllHoKpRR+daYgMV9cttiAZQB0O0Xf7Qdr0cPE6PZdIy9i1
 J5r6A8wOSjShr1WbBM5nIP4brbp7AdWgVpiSC51zJ4MVMlubzaLfCS/zp31DjHJyft05bsyt3/I
 /JS0gfVIc06lXzddcIqLW7AhDMlTAKCu/W5VB3yZ/Sb23LGVwQbirIhaCiUKvGis4ytAk4sNLlD
 yqZSdTBXY8h8j8TaluvWOiBFdGkbyFl4hkI9k2Imj8PDt+wnaLaVVXDXiGefpkn5TzKb1kv4ueT
 jgt6E6P5dNCG2rhr5rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230046

Glymur reuses the X1E80100 CAMSS block resources, but has only three
CSI2 PHYs instead of four.

Update the binding to describe three logical CAMSS input ports, and add
Glymur-specific CSIPHY resources for the PHYs present on Glymur while
continuing to reuse the common X1E80100 CAMSS resources.

This fixes the Glymur CAMSS binding added for v7.4-rc before the old
port@3 ABI appears in a final release.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v4:
- Rebase on next-20261120
- Add Fixes tags and clarify that this targets the current v7.4-rc cycle - Krzysztof, Bryan
- Rework commit logs to describe the ABI fix and Glymur CSIPHY resources 
- Link to v3: https://lore.kernel.org/r/20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com

Changes in v3:
- Clarify the binding ABI change and why the old port@3 ABI worked - Krzysztof
- Explain in commit dropping port@3 does not affect in-tree users because
  Glymur DTS support is still under review - Loic
- Link to v2: https://lore.kernel.org/r/20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com

Changes in v2:
- Rebase on next-20261112
- Use logical CAMSS ports 0-2 in the Glymur binding example - Krzysztof
- Add Glymur-specific CSIPHY resources for the three available PHYs.
- Link to v1: https://lore.kernel.org/r/20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com

---
Nihal Kumar Gupta (2):
      dt-bindings: media: qcom,glymur-camss: Use linear CSI ports
      media: qcom: camss: Add Glymur-specific resources

 .../bindings/media/qcom,glymur-camss.yaml          |  6 ++--
 drivers/media/platform/qcom/camss/camss.c          | 42 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 4 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261102-glymur_camss-1cf83f4a447f

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

