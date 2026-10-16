Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3653E4DD3CA
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160241; cv=none; b=Zm9oPc5Xb9RquhNzHYo+ViiIqyWjf69cP5aMv6uPnMmP5iCcBeTDsrspUy2MrUnPySj+xxtWJRu7kiLkIQ+SZOpngHjgCD3Fn0ZH/gjw+fwFYIUngv8mIXkMndk1PVQvehgbWLrpVppBZXsd/hPF8fbyymygVvZWWkf16NDxgB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160241; c=relaxed/simple;
	bh=ctZlcSVcJu8+Tbc907BCPo9NTDT13WghMk01OeQZFLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRG7FXd4sJFt2/aAZ2MPMcdap4Fi8Gu1qwN1xUiqpTDwprzmPJqPmAWyDHNW4+3x2ScvrqjSiQJNu+7TbWV8nOMGtJApuTn//KSfYI+UwGShMFa6uzztrq++jR62eLoJNixt+IEgpsYVx3slkoYP2oMljPxWrmqd9tW50CxsKco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMgtjo/e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YusVaAxc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMgtjo/e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YusVaAxc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5icE1910956
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ooOLvqIqxWGsuVJuYXDUntOZ0JDyVOzpiYV
	OeIeO0FM=; b=SMgtjo/eA6Jtht8Y7e8o8Nztc4Y3kcp183O259O2Fak2Lxz31Ju
	gyg4QgFD1Ucxj7B2rYN/KIE53ZvK5SoNW0Ntb/Go2FsEEc2KYX7dEBQhuMDYuDC8
	FiGVIwuVhlKS4JFPO0vlsNIZQg1NQk4jeL8+Eko/9LOdPYIoNUw76aBDnbNgXlpi
	HGF8QXMh4j9naHikb9haa0sVWF14RHPynCEIqIRy9oa6FnKQEdu/13H9GPYf7kT+
	Mma5r+90BMYeLCly9JKceBnRoYPP65+j8H7yTNFpoUm33lIhKah9rxKelIvTWzcp
	BhjDnWFnUImRa8W3oEEgSVpAMIvjlpKaDEQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8q4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:19 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9907de400a6so508241.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160238; x=1792765038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ooOLvqIqxWGsuVJuYXDUntOZ0JDyVOzpiYVOeIeO0FM=;
        b=YusVaAxc07cNdwRlB0Ig5cHSNpqU+EYwGQeagOoMPfzBCi6GCMOm/s0siPZNXQNQcJ
         tx3qjIdXNhfOxSWmPutKnW5FV3eJgxsdboMAmAABTGToh4vjUyAl6UW760vzPiJy65u8
         kZGbGYzrCeeCjJGb3Bh2aV659jHPzlFYdDjpn+ElSfcRAi93HT+NVKD7Ci0IkkDnFM/f
         hMbi2+oaWk22NhvJKA1Js0Qm/E1IdGuDfwDu894Q2hTP8G+ftdjlM3ie/YnGmSRcguVq
         Dwu6X90KwqHhShaXdTpF2PhEt9trH8LXTnmBhVzS7Q6ZerJS/HbVRhgngih5cTRs9p9B
         P8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160238; x=1792765038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooOLvqIqxWGsuVJuYXDUntOZ0JDyVOzpiYVOeIeO0FM=;
        b=i06Dywdm9CzV5IsoXbtw6ot1Fq3/LTXPiYzXmUOGbMYBJ+vVTY2QIwWfQ5Ew6YDw7j
         mmW78WA1ZcEkLcmnC/9Gt5T2Jd/51E0f5S6snJPFYVwFEZUT4mB8MzC22frjlyPrfSLQ
         7vl4N2v7smGPprytANWGTJuIR4DjpIgrh2PPSyPZycun5+LjIJz/SS8z65Mc3loP+ah+
         UySjuuRhy2L4eBu8O3jm8EVJZhZPDetJEm4FzyvJxJxDnfd6ZgGS1AWBRxSpwHK9wCGG
         p5hvm68fLq5tRiJoKw7sF35HYg97q3mV57iXiVmMGUxC6HMVNSxHfL1y6MMaTSmvx1yf
         Zh1w==
X-Forwarded-Encrypted: i=1; AKwUvBznlgDGUr4Ph6Q/6esBYvcnbC/glHDPNFNZNe+IdF5yshK+c/ZRXtQAijWfBeQUY8n4BfcuF+6EnDxqpA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKENq8x8aJIYif3GdAvlkTjO8SHa4ZQEg6xGa2tdDpLHRsiKEMX
	/7jCQO6tQgvM4NU8ROmMnhKzXSJa0jNHXz359B35YLTtw+UY0K8f16yvaqdu9X0JtifcM81EAfK
	lDHpXlWahOx7NEVAiWVcHUCQURDo7PnZicNLjyMwaX+AvjRZXfAPrewYn2DKJozYtwA==
X-Gm-Gg: AYBFou01SNK5S3IaXRNorK28wJCCWcCBBM4FX8BJaEO3I5JoIDdCQqQHQ9lW2H/R4bi
	yFmjTWROE+BLpc/R/3X5OMwWE6s+9o0AOOOSk7iNuPx+ve7xVbihilmuc+Tal0IN2ca2pfCA5rs
	3o/FbRpAsXX9g4qgk0qljytLSCxCglLs1iy9mXu7BM5KIb9k9xuT4153rCVdM7nKfQVxzTI3s35
	TdDDypPkgiJGAKSxVF9EBSqijxr3cL2+TbP/J53GrNhAJKQgIKh1da7SDBXvL9YA31evJNAr3Xa
	grsymg0roX2UYVcdU1bakNH1WufaVxGGwtct5ypcyE+h95oiSydO3EW8tM4V7grW+llWczsUH/b
	3nijk96BxqJ4bK0KyaYnZZ+Natarq4cLuvQX7v509ZbNcqmMBQawy8qP0eSEvIbArXB4NizwF+q
	bPozm4be89IdTzng==
X-Received: by 2002:ac5:c011:0:20b0:5e9:5e79:c7e with SMTP id 71dfb90a1353d-5eaaa8b7f87mr48824e0c.22.1792160238524;
        Fri, 16 Oct 2026 07:17:18 -0700 (PDT)
X-Received: by 2002:ac5:c011:0:20b0:5e9:5e79:c7e with SMTP id 71dfb90a1353d-5eaaa8b7f87mr48799e0c.22.1792160238004;
        Fri, 16 Oct 2026 07:17:18 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm71144166b.64.2026.10.16.07.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:17:17 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Alexander Patrakov <patrakov@gmail.com>,
        Leif Skunberg <diamondback@cohunt.app>,
        Sahan Nissanka <adee.sahan@gmail.com>, linux-media@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/5] platform/x86: int3472: Fix AVDD and add DOVDD + DVDD mappings
Date: Fri, 16 Oct 2026 16:17:11 +0200
Message-ID: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k0l5ia_vKOEeusxsQIFPx8l3Rp6ylRUG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX/46SpSi8oHEs
 L6ETm+GlGxE1Lb/BTpaFczW0q3Ik6BPDdEEgLjusdpj9FVZS55cRlEiIAH8gQqnAbXrqC4zIkX0
 rZZGzOiN33MoR9gsTMTV8ktG+8ziyrM=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad231ef cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=kVL90IzE1108TUsV_fAA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: k0l5ia_vKOEeusxsQIFPx8l3Rp6ylRUG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX9vVB8ze5n1CR
 vTPUqi36MqoKMDK2l5Kpr95w3RPl+pYNaTYigEr/0IQerAGjnBmVv6PwBDaOFzHF5/RCgOKYlw0
 FOYE/LMd5ckgbKVxFzcPfCPzhbU/vUYMocW0zRJLixdwcuMnl/xLI+1HhvA11kKIlWCczokd2OB
 krw1kHb8W29hWNqW4qhR4+kyEAL4hGnVLDlniXAC4rPlLJMkGNoCp+asgT3uqRBtKSmh0J+Vs9k
 mtp/9eDOqIcqVLpYg6RQjecYhZ6rh7XayTwOxYI3IHB8hDl1tqLxcf7rSCGfIYXJlqmgcpM5l1b
 +BKV4RDnMhPQ4sMamtAlVl1MdNV6WQ5mibewdwgU1foGmwJ3uMnx6FT2kb+X0A2yaYp/ynMCKZA
 Gq2fwjba0yL2HKkkswZgjEOKN0hMi0AVlkAMo463/w4+DmC1k4PyD4cNzYwMLJCmCGNobgMNpfO
 WXrdKniEf2SdDirLItg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160056

Hi All,

Here is a patch-set to sort out the problems with the Linux INT3472 code
mapping the 0x10 GPIO type which is meant for AVDD to DOVDD.

This should allow the OV5678 front camera of the Lenovo Yoga Duet 7 13ITL6
to properly get powered-on by Linux, without breaking any existing setups.

See "[PATCH 5/5] platform/x86: int3472: Properly map the AVDD GPIO type to
a "avdd" regulator" for more details on this. The other patches are pretty
trivial prep patches.

Note this series is ordered so that if [PATCH 5/5] somehow does cause
regressions it can be easily reverted without needing to revert any of
the other changes (which should all be safe).

Regards,

Hans


Hans de Goede (5):
  media: ov05c10: Support full range of power rails
  platform/x86: int3472: Rename DOVDD GPIO type to AVDD
  platform/x86: int3472: Add support for DOVDD and DVDD GPIO types
  platform/x86: int3472: Rename avdd_second_sensor to
    power_enable_second_sensor
  platform/x86: int3472: Properly map the AVDD GPIO type to a "avdd"
    regulator

 drivers/media/i2c/ov05c10.c                   | 32 +++++++++++++------
 drivers/platform/x86/intel/int3472/discrete.c | 16 ++++++++--
 .../x86/intel/int3472/discrete_quirks.c       |  2 +-
 include/linux/platform_data/x86/int3472.h     |  8 +++--
 4 files changed, 43 insertions(+), 15 deletions(-)

-- 
2.55.0

