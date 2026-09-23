Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB533B9601
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179240; cv=none; b=omzN7lFDogvMfQddh28fgy8G86WRvlj+6hzCO41hswMFcIUqpQrbyfIo/dyOmq4oKw3finArK1VJaTTFmWJdWw7rATz8Rr5Eil/KaC/cIj4FOTdsdzCIGVjR8vAITbF3THW9ztfh1DTuPSMf4QaIP/uIxEZGBFN4pykx+ownJdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179240; c=relaxed/simple;
	bh=t9VRl1nMX4c51HXGRlVcUrJ2vYPgoDYjYMTLiyXwefU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tQx0ibMxomdwD6CONyJ3NNPqf7UBzXpFnUFwWHAo98Ie/b5XI1xZRoPPvxriHM9M1dT/zBQnBX9Xm5NpslnqaPCxDSQpiQCqs6OCE9B/V33508D7HdwcagQ2p74qTG9u8QmrEOb45YmgzwNj0S7C4G6g1JthD+EF3ZX+17mkTKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F16QVdTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/hhmSGU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F16QVdTc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/hhmSGU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbTi43027920
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=; b=F16QVdTcNUJRuMuA
	XKkjm6q6esG4MrS3GldZDLLE02D3Wsc72I0C3CCsVyacT4az5+qXv6n99JWBRqLG
	8iAWAMxVgagy/gxaiv2KRcJTgHTLqTvDVbubrz570ocyZfyKkx8GdkYGeVP1klhn
	KLzSpNbNQ7O1CCiubaHHst2aNCBhFF15BQGtut3DzeazyBWPeptpz7CqfsfEdFUG
	G13US7jFtZX+2if36w0rQcMtq6qTkxjgArcRHjrDxc4S36kxrUVJLBStkD4ONYs6
	dEPdjbpXrpI5AcJgJLjAmrL0AbL/mhDhIRa+nZtqVOGL/gWyf5EPtjMfm44sWpks
	G82dlA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwasqxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:00:32 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-980c3b71002so878655241.3
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179232; x=1790784032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=O/hhmSGUhIODLiMG1nJ8jsJPLar6kCFi9302La+bHzDGf2MpPqg3SAEZugAZawJ1Ae
         wI3uF3RMMdRdFXFBfi7AqkijLy2zqNiEHL5EFxlYA1zh8/6qaJ0iEfkkeLXE0/qnJshy
         RRGSTi2LxPc+EZLWS4Ttls/rZrsIdgxzUWIMHKeUnpV1INmmcgRenPnFg+wQSww9RcfG
         eXzJexspzcRl/oHHpAdOHb9OGph8AVuCyBSLJ4zq2/6fDw0Fp0ETGpDhJYDdSov5itGn
         k7+GVr1AiWB0mm5wxIZelIsRWSDP1BuLuhm7bslFEyu8tsEnaplt16jPSu2g1NZMraIc
         PYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179232; x=1790784032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=tZy3rPyvnggLU1HF++7EQ6lJZeK2JPQNZ3yUimDsWDFwku+HdMBT/em/6n0lWn3a+M
         jU6UvlAnIvf6tXB8eo9SB6T1D3Gz+rulvVtiJbT380i8QVTgZX0WSZRVJGWSgro8AkJP
         MkAqdgAvNBT4pWW4LIx4O+5k9V5pSPPn8XVzZrKnYCrhN5dhkljciYxey2Tc+Aae3XCd
         sA0rVYS/OZ2zum6kGa6daR+KcwL3PhuH62uOCKAtej1WoeycT/hDIo/Wf0DW6HvceH0K
         ExaWGiQnWhu8i/3ccjHLUl9aMJi0B85q546NJ0FgNGOB7h2TlbM+Vu/88xSbH7bhPMZV
         We8A==
X-Gm-Message-State: AFuF++lYuVCZnpNAR7vJYML2yl1FSweJre+d8RS6OdtBZHKRaBLWpqm0
	dusiweZ1yw9Fuyc6uv1aoi9cutJA5Pe3cpXVRvclXr8Ch7zOUQQ9DFxZCW6bNxLpznTWvmR3TSr
	ib9b4dbh31q2mj0KVXi2U0bXbAuLCTup0Vvv/ntD8prtlta+rzpg39zw9hAeQWvdGKQ==
X-Gm-Gg: AYBFou1b8P+OIaSiVUSEfWP/dREoGULQrtuLW2aOLxDU/IB47+b1PwpRDQtreimVkiT
	J6FwdQKvNrcNQKicxdF98jjpQJcXr3+7GEA7hyr43W6/fu6eOAgTgAJF6LvJBo/86iNWFkPiJgK
	Orm/+0qny+AeaGoIQdKvPjiBg3bGLfreMfWQH03bgnbByYZwdTa2p5GFxaYoShKEsyPIrPwJxDJ
	icSCe8FqGh8xxiMdSin29c+31nmPMQsh9Dy+dzFBlt4gw6y5Ca4k3uAjicHc/MbBe9pbzMkSBJw
	Dbga4eUCUcDrEKdsKwDV6FVr/3X8Zx12Zg35B3YZKFPs9WlcVbfeGZEq3bhpWQ2mtrb6XHIpKkx
	46jjHTAbW+MXQ/U3159M1GrhQqPxiqLn9nuYJz5NZbbov9HbdcLZOZx7tQfmyHQFcL6aPigt6H8
	1tkZFscY0rVrrzopQF0KehWyfthKAl71u5rM/1hzyj05I36To/WGM=
X-Received: by 2002:a05:6102:1:b0:7ae:c2ca:8dd with SMTP id ada2fe7eead31-7aec2ca163fmr621407137.18.1790179231970;
        Wed, 23 Sep 2026 09:00:31 -0700 (PDT)
X-Received: by 2002:a05:6102:1:b0:7ae:c2ca:8dd with SMTP id ada2fe7eead31-7aec2ca163fmr621358137.18.1790179231302;
        Wed, 23 Sep 2026 09:00:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde197466sm80739325e9.7.2026.09.23.09.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:00:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:00:22 +0200
Subject: [PATCH v9 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-camss-isp-ope-v9-1-86a75dc18b83@oss.qualcomm.com>
References: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
In-Reply-To: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX/3dCpaSNdKp5
 u1LVonUGiXUdm18XQaFEiR2Vdc+biMwhoC/XYic1ds26csJm677EFjLuvQUzRhZoeuhFbVO2iO+
 NUCrrD8Itrmk2BSNTY+F59q/MbKW9+IEu9GxiblQgg2TI88uFqDHLO9XCj7yQHpajkb+dFFpW86
 OsA/fRl8lcyOSi9nMIoU+TA3CEmKC6f4dmBWiNKkRrOHZYXU2t6sF1pnkaMyrSTjDr+OKTeqDOb
 EtX1jz9XhT32cJo1fEDc5H8EAJGleF3uLUL+PeBNftR1LKXw+mkHNCOEoN7n+4IbQh7nekgBzL3
 gqCxSMU77lR+GAUalOFdiIlCxt/Qk1pODoBDV1KGgHQeI0zk1aw1jneQYM3dirvkZg1v1f5Bqky
 7Qsb8bGkLL0n12uibxAKgRBbSHcO+g==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3f7a0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 0VSMLRv8e20QvnNEapYwy-edrS5MSYfb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX0dGOsu6KknrV
 t4KIHK+fa5KK1ye7q9nobicY2orcLl7L6UPy/l/t89q5hw7RoP2VkwdmceLDjKxKoGBDETvSWi3
 /NwwPhlYh+UxPrdzGfMCuI+YfY9Riq4=
X-Proofpoint-ORIG-GUID: 0VSMLRv8e20QvnNEapYwy-edrS5MSYfb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230063

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
ISP tuning data such as white balance, color correction and chroma
enhancement settings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae707355a134047de646f61fcc2d1512d4c..cef1593c1835070f7b34a8b8c860738fb77f533a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..70208a9443d8ade569f130e2fc3d6beebab6b636 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -893,6 +893,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

