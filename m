Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27BB3845A7
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609483; cv=none; b=niZBk+tgpV8T5RZMnOPFCmSW67iLv6RANxwtmjsR1BEH0cS2JDdiYdHeTae8NrDMYcJaDumZjz7iJTVTpZ7wKdUeoWII12lXksJ+Em+Ce72WxdMW9j297zgaDCfEkhVPM2l+cstNGyJxlRxLeiL6veNWIjJd0sKkkPHXunMFFS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609483; c=relaxed/simple;
	bh=xgst01f4R/UxCDVV1F4gaFoFhiH6qRgFseib1YnLXZI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KAjh/wqQRqtESvUXJFZ2ifFrdaHeVk7Z3wpyX5m9BlTEomrsQpil+PFcpWXKUHRX5LQXY6rXYpIjshU8XRQT5qq29tZJIoZZOi+dtkSg1k1jF4cVHnTWPrFawv7bVnDrSUS1GswxSoOX0RLBzf8OijYMXEO+oz9bYFEM3xQ+QHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ak7raGIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Splz3GJU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ak7raGIl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Splz3GJU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCwiH4107655
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q1kdZY8fqAg1zkiy6i/AiS
	rIjleTEKdfGSM8hvmDMX4=; b=Ak7raGIlPNr+MLCrFqoAfn1jxWZkmoqY4SYkbI
	ibY28QvLTmrGbG/ouaBix1W/YKR5o7kKRomPnTWmtO88SsyNlSRrVzdikiTrlOSR
	bKrLPXPzwwxcB974m6yu6lmALT202Bd49O+b6FEjHhYeEWP48tujEHjKvBEYRhuo
	0J5wrus5i22kRk8Vm6HHa4hpbBQ2MC7yHgNgKCCvqXCC2uUlYPMDIurxmGWSX6xP
	S5H1d8Gc796rut1u0Ha9ZuqlLVb4Hn2MmoZBwrSaZ3PQsSQG4p961Y9n8kqBWiQ6
	NJhmg2cMYS6Hi345+JzWh/mnbt1C00FKF1Zd0q+0h0wpAA/A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn949n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so3789690a12.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609479; x=1785214279; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q1kdZY8fqAg1zkiy6i/AiSrIjleTEKdfGSM8hvmDMX4=;
        b=Splz3GJUb89XThQ6CfLehGmRj/JbfjWI/04bmtHuP0FKmJtS977lUH/HFetKWnFlCA
         HMckvRIH1rYXohqTyOPCxrMtxwSqSCnlpqWJ61Zc25wojeJXnrhGdW3cyxovNOwOuZBL
         sN8ODnitfvf93yIjPZk7rF8Nc20WOzpMEHjsRqbOWjdXrxibF2zRIF40ZWC4diBEnX7A
         L/PgyhVf43t/QoumRKXm1CRwi+mirJtUHNkv5o3ZT3NkxSdKE3RQSH/1maoA2zip36Qo
         +AW5BO9jJ8oh6HnU6tO6UdXCcYI3SPbafyL5/bbGZIjWOsDQbbvTYSvSz3ectuT4tfwy
         mcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609479; x=1785214279;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q1kdZY8fqAg1zkiy6i/AiSrIjleTEKdfGSM8hvmDMX4=;
        b=sFhwYGtHaAdAXAcIqZ6hbSHU56qhuHH/BU4GgA4f9ScfDkk/0pYR+FZ7idoq/sm3c1
         DLZuA4QgnPTXony9SHAzBthvQZa5I7iRD+ukpRXYfv1nKfBrh2ltexnkCl5TtlkCcDZg
         ADIhvi2Rl/bbY9E5pH3FSKS6HXjKRtxQeeabRQthIZBJmBo9ReGWNHEcJpoXcFLBmOdU
         9yMxvS5dkvjkCJazSr0syQJ9CZmmEPyiRszpGrWkimSj2+2mG6tCBPYCmQt00xhgmUFo
         ls9fs35tBLG14/AkkcGucka0BppAkcBhOxOm3G0lvarW1D3+dmIYn3tvEfqwJkbAmUVW
         wCBw==
X-Forwarded-Encrypted: i=1; AHgh+Row+UBpnlfD4Xcw8uKmeLGqS2VCSEjHraKcXpZbAWZHqeibJTzzF2xvdjdOzudphtpSC29ilqSQ4o+/Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7dIz7SwtB6Q043+2I/hA5NQdSAfVhZVDzJMYmZa0wcKWSNfUR
	1OBOyl81gfqRj29nfpHZMQEmeqHrVOeejh3ttUJXmatKfMur0SC1t3u3ZTx0v5kGOjHKNwL5S4Z
	JhIFaU6vTGOgkWXjFkGdre64DebMfgsVPXLITKjh+rbM4BxEPcTveVm8kFiLV3xFP2g==
X-Gm-Gg: AfdE7cmG0Igbdc0YhssbYgKhq7hIdKRbbsF1/+vHccdMe86/9Y79rLXDko/ILbjVgB8
	ibrPEAwdH01UK88b7BA0hlziaG+D1HSs/vAHQYX4t8L1AhyAjAdyB6/ltLo9p5UgPPn455TkvW5
	GO3Vp25Gw+Hs4DF4SvcVhp78Mu/7f1zUaFqa4k/eNV61CACacF5ZqwnCWamwZKJI3bJA3iDuALb
	QO/Y79032j9LluQDgaUH6wWE5g4aT06g4sVOLZjvZ+v4XaZSVWOB3Xv0HDHwk2w0lExvSLdbFyl
	snbeTZ/qYIffpbU3wVCUAz9/hNeOYERC3TcZwKcyLEB7YpOynh1Vqjv3Zt8AEJ4/Q7Nm2SsQNcR
	4+VlOcaj1GG7xckt5JiNdRnTeeG8AQQBQ1M2TFu/B+PzDXYtuH/PHddA=
X-Received: by 2002:a05:6a21:2c11:b0:3c0:9c19:6592 with SMTP id adf61e73a8af0-3c3ada36c4fmr18725886637.76.1784609479254;
        Mon, 20 Jul 2026 21:51:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:2c11:b0:3c0:9c19:6592 with SMTP id adf61e73a8af0-3c3ada36c4fmr18725857637.76.1784609478746;
        Mon, 20 Jul 2026 21:51:18 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm37963183c88.14.2026.07.20.21.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:51:17 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v15 0/8] media: qcom: camss: Add Kaanapali support
Date: Mon, 20 Jul 2026 21:50:33 -0700
Message-Id: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJv6XmoC/3WQ3W6DMAyFXwXleq7i/AJXe49pFwmENWuBltCKq
 uq7z8C0TRq9seQj+7PPubMUhhgSK7M7G8I1pth31KB+yVi1d91HgFiTwAQXhiMKODjXuZM7Rqh
 cmxJYaa2olQpNYxltnYbQxGlBvr2v/RDOFyKPq8i8SwGqvm3jWGZdmEZY4FZw9vdqmZGsuUUOE
 9JCigJO+xs0RknljcZauvKKcmtJogSv4Bi7ywTrCQ1cAsn1mOIMzDly/u0BNTeNVd6vSPEfSe+
 hgXTQn50GH5QUvioKV+Q0zmab+5jGfrgtQV4RF6NPM6MB4JBjUI0unK55/tqntDtf3HHOZUdlg
 c7ufkCa5xsgSSChFdZ50JpCeQZSvyD6aQOkCBSsaYRxzphiC/R4PL4AglAx/jECAAA=
X-Change-ID: 20260112-kaanapali-camss-73772d44eff7
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX7ElluImtE4ft
 eEO5o61AT+hFduq9beEAISgfkm85IRTKplsn+EKolUMjgnn7Z2NrV4ZuaAxhaHqs8ioLhFa8FRf
 Usvv4nFVAgLXRIQHSFU9Uj7KLDfzsoCMWgvxGYDqVMqH62Rv/TeeDsNeXrNglAuc0szFcXKMKzN
 40CMzrgjpSGWoYVkJBtk+RMZ+wQ1LDOui1BrwYTTTyRF4sq6kxuCy/L536Nme25Wwzxyj4zumwN
 635vuqwT09kRVdPplbFfju2Ux+jDbZc4Ls05H1UkGoyZAX9asU0CFZr3j+yTDIY0rd+AvMSE8J1
 X6JGbrAxBzMmiTLf+qaXziR8sfONt1pRcrJw0E8YagjaHyx0rqehMa0e87amVcvg03fwwwi0p1N
 /MuSBYzit239J9Lqk7NEVwgIBkMvsPvAmMi586894QR2Hw5XCFEcSQFxNZpLlAK9VBGpt4QnMU3
 Z2DNybt5Ioop6YACvkw==
X-Proofpoint-ORIG-GUID: rtc8oLbMttcDpqZzLbGf7FrwqLOFPDa2
X-Proofpoint-GUID: rtc8oLbMttcDpqZzLbGf7FrwqLOFPDa2
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5efac8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QPHGzIHLvaTaApt4zBUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX7i+6fxkLp5Kd
 GfPPRCbnMfl27TVXVhtHbOmXX68z+R8Ajuf3/1sfAFh+o/+6AQCFxORYAjs2nrKPesg34f2YTAv
 rTh/fXv63oGS+APwzHjIDXrxzznBkqg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210046

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera subsystem provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

This series has been tested using the following commands with S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v15:
- Add TPG v2.4.0 support
- Drive the CSIPHY through the standalone phy-qcom-mipi-csi2 DPHY
  driver, which let CAMSS csiphy_res only carry id, ops and formats
- Add a preparatory patch parametrising the PHY common status offset
- Add the mipi_csi2_dphy_3nm_kaanapali config and "qcom,kaanapali-csi2-phy"
  based on the new split-csiphy arch
- Link to v14: https://lore.kernel.org/r/20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com

Changes in v14:
- Define 'CSI2_RX_CFG0_PHY_SEL_BASE_IDX' locally in camss-csid-gen4.c - bod
- Align csiphy lane registers value capitalization and case rule for 2.4.0
- Rebase this series due to conflict - bod
- Link to v13: https://lore.kernel.org/r/20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com

Changes in v13:
- Remove prerequisite dependencies that have been merged upstream
- Remove redundant empty 'regulators' initializers in csid and vfe  - bod
- Revert binding from full hardware description to CAMSS-only scope for
  modular and incremental development - bod
- Rename icc path names and vfe clock names to drop redundancies - Krzysztof
- Separate port index from VC value in csid_configure_stream(). Previously
  vc was used as both the loop iterator and the hardware VC, causing
  misconfiguration on RDI path starting from 1 - bod
- Link to v12: https://lore.kernel.org/all/20260112-kaanapali-camss-v12-0-15b7af73401e@oss.qualcomm.com/

Changes in v12:
- Add CSIPHY regulator current due to regulator interface changed - bod
- Link to v11: https://lore.kernel.org/r/20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com

Changes in v11:
- Rebase this series due to conflict - bod
- Update binding commit message to align with previous generations
- Link to v10: https://lore.kernel.org/r/20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com

Changes in v10:
- Update interconnect and CX domain AXI clock names to be consistent with
  previous generations - bod
- Update the struct name for csiphy lane register settings to make it reusable
  for other compatible chipsets
- Updated power domain names to IFE for consistency - Krzysztof
- Add description for acronyms listed in binding commit message - Dmitry
- Link to v9: https://lore.kernel.org/r/20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com

Changes in v9:
- Updates the names of some of the resources in DT bindings to be consistent
  with previous generations and improve the commit its message. The name
  changes are also applied to csiphy and vfe camss resource lists - bod
- Link to v8: https://lore.kernel.org/r/20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com

Changes in v8:
- Change csid and vfe driver file names as 'gen4' to reuse for other SOCs - bod
- Add missing register descriptions to binding and cover letter commit log - bod
- Link to v7: https://lore.kernel.org/r/20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com

Changes in v7:
- Add ICP SYS registers to camss binding - bod
- Rename 'is_deferred' to 'reg_update_after_csid_config' to do rup/aup
  after csid config to make it clearer and simplify its call path - bod
- Remove unnecessary bitwise AND while configuring image address to bus- bod
- Tidy up a comment and a couple of hex values and csid/vfe - bod
- Link to v6: https://lore.kernel.org/r/20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com

Changes in v6:
- Modified the bindings to represent the whole of the camera hardware on
  KNP than just what is exercised by the CAMSS driver by extending the
  descriptions and the properties, the regs, clocks, interrupts, power
  domains, iommus etc. In addition, use the word 'vfe' everywhere in the
  bindings to be clear that all of those resources are referring to the
  same front end modules. - Krzysztof/bod
- Change camss vfe power domain names to align with the binding file
- Link to v5: https://lore.kernel.org/r/20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com

Changes in v5:
- Refine v4 change log - Krzysztof
- Fix typo by removing redundant numerical version in kaanapali camss binding
  comment description - Krzysztof
- Add missing tags that should be posted with v4 revision - Krzysztof/Andi
- Link to v4: https://lore.kernel.org/r/20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com

Changes in v4:
- Add detailed hardware descriptions and revise message title to follow the
  standard comment format for kaanapali camss binding file - Krzysztof
- Format kaanapali camss binding file to keep style consistency, by reverting
  power domain name from TFE to IFE and keeping clocks name order as last
  generation - Krzysztof
- Separate the 1.2 and 0.9 voltage supply DT flags for each CSIPHY to allow
  for arbitrary board design with common or unique supplies to each of the PHYs
  in kaanapali camss binding example, based on v2 comments - bod/Vladimir
- Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com

Changes in v3:
- Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
- Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
- Resolve the dependency issues in the camss bindings file using ephemeral
  DT nodes - Vladimir/Dmitry
- Update hf mnoc name and bandwidth values for icc module - bod
- Split CSIPHY status macro changes into a separate patch series - bod
- Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
- Clarify why the RUP and AUP register update process is deferred - bod
- Clarify the necessity to keep NRT clocks for vfe - Vijay
- Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com

Changes in v2:
- Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
- Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
- Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
- Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the procss node in csiphy register list comment - bod
- Rename the variable 'cmn_status_offset' to 'common_status_offset' and
  align this with macro in csiphy register structure to avoid ambiguity - bod
- Aggregate Kaanapali items into the definition that introduced by
  'qcom,qcm2290-cci' in cci binding file - Loic
- Format 'kaanpali-camss.yaml' binding file
- Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com

---
Hangxiang Ma (8):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Kaanapali CSI2 PHY
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible camss driver
      phy: qcom-mipi-csi2: Parametrise the common status register offset
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID gen4
      media: qcom: camss: vfe: Add support for VFE gen4
      media: qcom: camss: tpg: Add support for v2.4.0 TPG

 .../bindings/media/qcom,kaanapali-camss.yaml       | 426 +++++++++++++++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   4 +-
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-gen4.c    | 391 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |  27 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 197 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 305 +++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c |  32 +-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   2 +
 14 files changed, 1393 insertions(+), 15 deletions(-)
---
base-commit: 03cfefef0119410fc464d0d56e83626cb570b7a8
change-id: 20260112-kaanapali-camss-73772d44eff7
prerequisite-change-id: 20250710-x1e-csi2-phy-f6434b651d3a:v13
prerequisite-patch-id: 2f70527d6a880f047a4858f75813420c81b4667a
prerequisite-patch-id: b797e1ad3e25f79b0bac8f885b2866206a6e0260
prerequisite-change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a:v12
prerequisite-patch-id: 6e8e67cd3ab96a602971bbeeb7dfdeaf3f1426a2
prerequisite-patch-id: a7fbea14628b62a8de096dea420473b283010aba
prerequisite-patch-id: b6b6c4e7a5818e1b93fe2758902bd32d2be48509
prerequisite-patch-id: 6fb94a3fa54b9810ff6603960770011db1f0b2d6
prerequisite-patch-id: e31f60c0c41e5b6baa464339263a33e5b2d69fac
prerequisite-patch-id: 83a3c9f2c2478a4a3a9441f58c58d04b04cec44d
prerequisite-change-id: 20260716-sk5jn5-be432bc99a98:v1
prerequisite-patch-id: 5a8e92e10feeb8fff285098a956b09885a209928
prerequisite-patch-id: e485d00fb1ccffa84f85f4aba151710c39b23702

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

