Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100674;
	b=YYR8czZvdxayN513IOGDgX85uTY91XTMKCn0CGKNyYzG687eNflnyOZ6/mZDMDvf+f81
	 kpg2WvEwdZWe/9VEt4aOhKGPbAWCAEKESjgGd5q6brys4773p/FMpj055Mh0z0lRy2+AM
	 pYEk4gHJ7urg0FetdtGbLQTJWLO+GDEKZy3kRnpLLxEMcvhSSJGENOd+kfEjCasn6q4ZU
	 Pq92W9KZvTol/vU7K5he1ZSFoAqjHrMM4D8htM8ksBs/3R3w6JZj4POHbNcBBhTk7M/oq
	 VjIR/vcI+PLMCL9s0A6Yrp8SSfXGhTkur/YvfjBIieNTxgiy03b12QNp8fBWSuoUtkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=++0iF9WZyX/JF7xCCfezhklFThYEjJZaC0MbC0RIVb0=;
	b=KluM3ozRWagMEx1p1Xr/XjtoMuFY8yJbQxQV5cPeCJaVrKRk1dzmI07xhYeriVMt28fJ
	 44U4bUQfRZsoN7P9PVvkmCiKra/iSN8TXeZUsrcNzhWP10yUCBn7Kb97bnjlsyDckcIVw
	 bIiT9qs6VSRp4HHTZd+htr/NHSY5o+3SrA/T88ydZbL8ZrH6AH1J3ynhEmezKbkZxEXOR
	 FKIsuZN1sl9MpUGVx2KR/ADo9PYb6oooYCYx0FWOXt9if8bIihiBo4UUr/yOng4ZK5Xhl
	 i7+Yqd00zCDD5FFNt9spgTJVXst7Jp+RftQZH9L5GJQZXLwRebuTTjo9fD8eOm1KMtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VT9U/+JI";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2DRbbaf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9844B606A320
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 15:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9844B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VT9U/+JI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2DRbbaf
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJEO66W1319077
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 15:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=++0iF9WZyX/JF7xCCfezhk
	lFThYEjJZaC0MbC0RIVb0=; b=VT9U/+JIol1dJh/nIKYyMkvI1G9SrhOf9so3hV
	iS9p+LAoXOkxT54vyTlWZPyc0T6qB4Q9nrpXlHmRvbqBBQc3OwpS62bCoD0Q/HXA
	JhR5u9w3Wit53h6TV2RfR4welYpvpemtF3eJaX3rPY3CbPhBwM6zdQ7krAxpespO
	Zd/aW6ZbtUt8Pjvv/8ho/mHUhT4XaNZQd7qC6i6LXMCjHfHKB1Qpy3EDQagFYCRe
	8F9OOPDkUbbK1wLxQD+qI++OH1YSNM9Vh6g+M0ag52U8ZtTQOI9tUeIe6+pr4NDR
	a37pNEBCAUGXoYnGkNfDcvsQRQxtm1ESX7O4ewqF+6nLHLjQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j22ugr5a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 15:04:32 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67a781c1069so3463597d50.1
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 07:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795100672; x=1795705472; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=++0iF9WZyX/JF7xCCfezhklFThYEjJZaC0MbC0RIVb0=;
        b=T2DRbbaf0UnIPSLUXt6eNGWqMX0EkAZOyr9ZZ4qDI4eoZNhc8y56q/yd2oAvSgzL5H
         q/d/9UpchSlEZOt/ZaIsNJaw0utyZtVa8Q0qGC6gu1Apoqca88rXJRVSVgDAQ7cFfkky
         5xQsO8cJSnHObu9ip4VhEuXrif1t2anTQ6zfIck0w25FdBlKK7lul4MeinwtfurL7Nl/
         OS2+nTACJkB4sOzAnWGZ5XcV2Sw/eerpXZTH4/mHc4lZ8xrljZiM7ygipDnvnZBut4lS
         9ox3NlHjs1eGDTzYr6qgzpOsNajGyFDpCR+APHd49ZqVQ8KmKSdqy+4gTKHsBm1FkBaK
         b0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100672; x=1795705472;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=++0iF9WZyX/JF7xCCfezhklFThYEjJZaC0MbC0RIVb0=;
        b=LZEKux9b2h6yONWuVNVeZB1DMQapmYV6GqXwn3GJWSCAOiWXjBx4D3K7FgSxQS3hK7
         NjviYqbSYdkJbfEohEtnjMiEAudgdkARlfzJtk4/zuKk7lA/Y9gQZPfqv+0WEse1GJB3
         e15w25PyUQpwvP3Y7G7uu1VvauECYwVCyk83+TIub1ZBzIJ8hxSo22GxtrAZ5Lukd8Ph
         1S2XirZ4y3z6OApC0/0CL3IEpPv6GvkBaQBJjXWfwbed3P5ppZfEOORt9vE4tKylp8fw
         qyPjAKi8AoKHGWwv20QPfK7IzGvz4zZ8ID3d2Mml6YOTHUQOOz+/39tGTfL6Hxf81B07
         DgHA==
X-Forwarded-Encrypted: i=1; AL+hErE6O0yVSw7fHE83cIsjY1yVXJnMugzRJusMoBVTeSrORHpbCPdIU2fjA7u9NWFyGL8knXPwi+SIRzvTTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/t/uYWf28rwhVbjQlOpOQTMRpNSmqvN5rLuW8A25THK7YnVNme
	nuddD5r4Lu3jz/UOB6hMxYEhOatxeRiSmcvUaIyk/tzClUL4LzV6mramcxvq41ieloWkB4k02s7
	xmlPE7i2W1zGB4afSLanO0enq5UsL0Zdkp0rFo7sIAC8jyDlBs0ful4+sAstT2gCFgw==
X-Gm-Gg: AZFdTZd67++WjaJ6CjUlV5bDQ5OzK36t0NOofrOpNDSkOYEugt/9x747BRVxdYQ+8q+
	K+SPK2wBFuE+Te/IGV8E/4qlLKDIniDrfgT+B1ZmKtcvdgmXD4iCh6t3hF0rk0TLpitXqQJFL6Z
	eMAX4sXmNySDFEOSQyMHZZTfPJIEP3ZgbBVutQbcQPPmMl/OU9ruRP6+aq5COQI9+6HTfr/4+XT
	kQORuSs6rOKU3NbcZXSzn1cQbGiy06KshnMZlJCW/yCL+sjdxPV7Htr8PIbd4elBNibT45Rs3dN
	5LbMyRqrN1DT+LLG71sd8qkNFx7IV7ZyvsQg0YEBBcL9f3YUualPMY5To/JblSKRTpB1NZcqVnU
	sdH2yQgov3WKMHCdLiLgmqURRvKWB3V1nuYjLbcoMBnM8TuFzc+h0MzvTpzaSXWlbp2OFrUNrX8
	Jt56Zm
X-Received: by 2002:a05:690e:1094:20b0:67d:bbf9:11f9 with SMTP id 956f58d0204a3-67dd3f5a9damr1872161d50.41.1795100671641;
        Thu, 19 Nov 2026 07:04:31 -0800 (PST)
X-Received: by 2002:a05:690e:1094:20b0:67d:bbf9:11f9 with SMTP id 956f58d0204a3-67dd3f5a9damr1872096d50.41.1795100671087;
        Thu, 19 Nov 2026 07:04:31 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33d64a0sm79790d50.22.2026.11.19.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:04:30 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v3 0/2] media: qcom: camss: Fix Glymur CSIPHY topology
Date: Thu, 19 Nov 2026 20:34:21 +0530
Message-Id: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPUP/2oC/23OwQ6CMAwG4FchOztCx2Dgyfcwxoyx6RIBXWGRE
 N7dMS7GeGnyN+3XLgS1sxrJMVmI096iHfoQ8kNC1F32N01tGzJhGSsBMkZvj7mb3FXJDpGCMlV
 uuORcGBJWnk4b+47c+bJnp19TUMe9SRqJmqqh6+x4TMq2qFgrKiPbmmzzd4vj4Ob4jYe48P+wB
 5pRo5oSaqNEDvVpQExfk3xsdhpK9Dz7MiD/MVgwGmhEWWS1Epz/MdZ1/QCKKnSxIwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795100665; l=1632;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=INChXq1vpYh0albQLEYJFLkXE2g1hDB7cFuP/mfs4PU=;
 b=twsJFl8WfgRmeqZAMp3KIlEyDduOCWgSQgEzksZkjU5/0bZAmfAPiopIEiooMjgaRFJ93RZZf
 lZ3Qy1gL9rSBiAUXaLbPeheBFxquGn2eoyPKRqjmEtV9VSyXzMto2Ia
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: TCVKt4vxDT1WMStdEekYDrfLAzr6IGaE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX2SjMpeQPABpX
 fps1GFc7LNY1lCAeJM5CieHC/uY4rautzh4Qq6Ih6YaTh1TF7IlXclCsftaZrSrJ3eHGOB67wCN
 iJGym/fQbfp6ruPVms3jjE49RiYBjRw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX2pK17MnD0zTf
 nVWul8ERoSnVeUgiyHUm2KrjVOpu55Z10oCMz7YVGoA5uLtrfklC3eCyH0H7tnLiaHXxDh/KpRd
 1StC2qY50itarS2+6ARN9xVbC7kRNFzLWL98dETtMK5WUlphhk9A8jptE6TU2mdGoYf2v8cXwj1
 Rs8ZMXWaGqj1VKpmWJ63pyA/LtrvGBcvKARQyaeYkR/gHlyq6e5wY5IdY+0G43akfgZdSOgaLJX
 0ZxetHUrZDG4BfmmI7fjNj+nfKl0beMTBGS+LTR+FjQcCyCkwGHsi1Lf5cvU7uWlrnYe2UCEG5h
 ct4HWhXvo+q3parQzX8nReYGoVqDne7jCJMn9zeo6UyxcfxNCbt0qw/dXQB9UlhhHgYZWqpdXUg
 0EYwsiPqub7Ac+LVyskiW8TV6rkkkKmWHrSLJBywM9tsKsxfcOc165Rc3MuM0mt1M7zF/YPmiIZ
 uRUx+t1RbxQuq87cMTg==
X-Authority-Analysis: v=2.4 cv=YeEodARf c=1 sm=1 tr=0 ts=6aff1000 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ffzozp4-zBr36aKF_PUA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: TCVKt4vxDT1WMStdEekYDrfLAzr6IGaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190059

Glymur reuses the X1E80100 CAMSS block resources, but has only three
CSI2 PHYs instead of four.

Update the binding to describe three logical CAMSS input ports, and add
Glymur-specific CSIPHY resources for the PHYs present on Glymur while
continuing to reuse the common X1E80100 CAMSS resources.

The Glymur DTS is still under review, so this updates the schema and
example before the old port@3 example is used.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
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
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261102-glymur_camss-1cf83f4a447f

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

