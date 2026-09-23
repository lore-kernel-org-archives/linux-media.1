Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634DF37DE9B
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 02:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131306; cv=none; b=S8++k98HRPB5P0wk7/FX0XKhJEoAdXGSyZGcDxr2ZMx0ocPINyBoVbR2AQvFYFb2ngJIr08BCcIxBiGKxGZ8KSXNJv3zs9XdTh87VNiAOPsulzv3xxn9tG/TvSKLZXauMeuGsQ8Y2k4cb0W2V5An97QhN49Ya5RFbLe1UMaDVuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131306; c=relaxed/simple;
	bh=3zxlA9C9JDSmEjes1CWNauY2jFOEDhJh1YydLUT1UMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RzDq1Zap7CBKHV8HN5ueOD7SjP4u+JKfENLMrU+JEM1g0Fgp53lJtUw538X8hKoxkIpkuoM5BckMBN9muLEmKLxRW4vNZJNfZWkRzIiDodhElgbtJFzCXFu8OKLYjRDJRpX/md6/lyNkDXzdz1U10/mZ7RkuWgTUHuX89InSJGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bA2pmQqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UaHmaysT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bA2pmQqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UaHmaysT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MN7pon1402040
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 02:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVu70ieuUFEGlNRXy7mMCfRjrDkk5y9s41r6Xx2+eZM=; b=bA2pmQqUc2avg4UN
	xCfbCNscMs/GPA8JCNyLaWKYI1FwNHK9xQLB1A4D8ZKQMQ8EhjnfpeEDOguQGh+P
	MkAiRXzRdfKd+X7gTI0ctlCeHcnjmKaekrbwT5nmHWmaRjffoSTpD2r+ySnoBdqh
	tfT8eGrSc8TlYEPqDkp6OcL3u0IFCzEpSJUxiS1iKWeLbqndgaxw50PmIlEs9RIJ
	ckEfdjGZGoCSFzuPONBFAnZzlxDvb6pQSP7dE0hsFaPLlz75RQMM7AfxWBf6fLgi
	LGemtbLKlatt7sUFwMdPgdgydgfy04Ou8rQIrW6FXDW7JxmrDHyrhWvVUBQuMZ7U
	3vV9GA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv3318m5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 02:41:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1226138a12.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 19:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790131303; x=1790736103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVu70ieuUFEGlNRXy7mMCfRjrDkk5y9s41r6Xx2+eZM=;
        b=UaHmaysTmVwj2fTqQWiYL3/luOA9fjLvISXAbOCTiWI23iTxA1AHv/ddnOhwuewu2f
         X7BVPMXhd1RQvshINFct/zLYBo8I1Y1dmPy56LFpIhnn9Ftrpo+vAvZBDB5UpWQrfllN
         roxWYwryHo1SwctJc0cqjGa6/i+PgJbR0xI2CUOjrqqMB/xg9KOlvqfXkOvgLib5zeBN
         h9dRxWm9QvU/McXvzl6Yb1hD7Zk37GFv7I37RvV5bmFoyer/EIndOO2DWFRLXkl06GEl
         96nZ8mawMzTqmT434J/6dnFgjmZ0/dp0fEQBsj8TYBc6p0vXiAg2jXVCE7QEEAyfPAyX
         yjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131303; x=1790736103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVu70ieuUFEGlNRXy7mMCfRjrDkk5y9s41r6Xx2+eZM=;
        b=DEaSeOyXgMkyBYmSazRIz2ewx0/wd0SP07fiA8EUnV/4JMXmlXc0hr7KxrmYDctKvZ
         70y1bz0sLJrPaGREKWV4l2PeebnhW4ztMqC7ZH1RHOkZkgdP2EkCweXW8dad9uhZ+VAk
         9wn9dXx/J/ZMMMuF+zQoLwfI5Hk65NDgtTh4gxupV21tMiAZGeLfREc0cIq6zJ/Ospqb
         P2LIvKExw/j91J9/i71OXfK35v7CVv6jBeCtSYZymS8Aab9Qr7Pr3boKcvP6AwVyw5fd
         ksglUZB7/wH1Tz4som1b7yN4J/vkLkkFBSKU2FGRtehPlNzOpZekLkRG8GJP5z63Cyu8
         WrFg==
X-Gm-Message-State: AFuF++lVcSERzIvj+mCxj8Y7yVXjIfQgLtb44jGU8OO2KWxaZI0fUY9o
	jDGAEfliZeSOTGlzTcBkIkNM0JVD0IhmHyEHhPt5PE7kAWMlrlF3VGHUdxHl8hbgp+uyJ7sK4Hc
	FFMUoKQTbnJ5PMNg5FkiDRNBTt5yfJbbJqESiZhyP4qwZkuNmTO5DE3rOWLYKTnushg==
X-Gm-Gg: AYBFou3nE262TtUFXlJE1K2gES2DAKu142xOsNg7n+K7RIyOvmupvDWvUI2vs68jnEY
	OIS36od9RXYgtaTmuIcJgUepZ8J3Q4O69Gw66YzBnQqM4sXRhd6eoVgp4UdC/FEy4I25NPacduI
	cUaUITe+xOV8dRTThiu27Ydi0l1xqCmqV2RrXYuS8j3+zmvp4UawmtuhzUsoL4mxb/EJMZq2n9O
	KoKBfJDLRGTeW0K073yh29l2c9xP7LR4Q906TkbDsE7G7nDinpPsdZf/p0ZBuXYQ6vm7sNX14Lt
	jLZ7IDZY9uPtF9GvBdYMog5kgEhSJusAa2EkIiwu9/cK+B9wf0/4lF3zY+IBFV0RZpYnX01/Mib
	9sanl2DUsaiocuO/quSo989bwCA5SpobZDO/HZegrn4/91WTVlN3J9J8OIZRLfVCcHTaY3ImWgw
	==
X-Received: by 2002:a17:90b:35c6:b0:39e:888:3841 with SMTP id 98e67ed59e1d1-3a0730cc209mr2331122a91.16.1790131303288;
        Tue, 22 Sep 2026 19:41:43 -0700 (PDT)
X-Received: by 2002:a17:90b:35c6:b0:39e:888:3841 with SMTP id 98e67ed59e1d1-3a0730cc209mr2331103a91.16.1790131302713;
        Tue, 22 Sep 2026 19:41:42 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm2102026a91.4.2026.09.22.19.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:41:42 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:41:11 +0800
Subject: [PATCH v2 1/6] dt-bindings: media: venus,common: relax
 clock/power-domain/iommu limits
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_maili-v2-1-7223738e330d@oss.qualcomm.com>
References: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790131292; l=1484;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=3zxlA9C9JDSmEjes1CWNauY2jFOEDhJh1YydLUT1UMI=;
 b=xC/oZzacAZKTxllMGctJ2NM9Ibdy/kdxR+CmqgGSv0DFgAVOikavTSjoDW6M/PW1ipIa1OeHS
 ZFY2oVh/LGpBn1HKE2Nj23jmmjch15//pD0neGeVB51x+aawwrinMWj
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: lclv4MJ7MiOKd0K5gKDQ0fDmXXWn3yKW
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab33c68 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HhAAYa2kYXLYgDpgJ-QA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: lclv4MJ7MiOKd0K5gKDQ0fDmXXWn3yKW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX9sUOX/Kxxk4W
 1g0owVimX4gDQ1P0lpTsDrXXjhR1Najbq3pEZE6y/xHd8znjJIwgwyAlu813CtMTHhou03ne417
 wAgN1Fszi1ajWyHhJUhq2yfhxtxactnjHQkGsZjFrfvaC/1YiVfXH+UhW86xYRHhAIMW+qd5l0c
 01KsCwtrr1UyBl03fho6NkBKcTnGgwa3CgMF/IfbxydsizHieNGDDMBEfKORjWqpWzaFJB/NfnH
 I8KI54JJ00Pi1MB4OLZMEyL/ai+bPSG8B8eqsCKN/6sIX5FhIIpAmrVjxc/haeB2vh3Fs8e1O/l
 r+TpvVezyXYXqONFm5KZnVHltxcFuMwqfjTyXJQhyI4XLuvybyyh3w0yn6G+I+iBhRHnKYGiVHU
 LlhHtvs0vNN/DmHACzISfJR0HK5gNyjuYbCbUT7fmJ5Bcz0SWEDlRoa6p3WPyBs2qB10uWFc8qJ
 Wh37lLfPftlIKSCwVIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX1yaRRXVp+Dhi
 s6k4ilWO9aE9+IXrNLTuhw6HzIn+F/4to87rUIMTm9Tln0u6cvqwm4mgLuxIKvUlkNJC9elUGXr
 9HjiTtj2Nvv/5EbIiWnTVxl62DEl45U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230010

Upcoming Soc's Iris4/5 video codec requires more clocks, power domain
entries and IOMMU mappings than the current limits allow. Relax the
common schema constraints to accommodate it.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,venus-common.yaml        | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 68d5e592a028c5eecde04ce72cd5ae6815ba5c82..18891f0859eef7e8e3739a4b94e3abcdcb9d6009 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   '#address-cells':
     const: 1
@@ -64,9 +64,10 @@ properties:
 
     properties:
       iommus:
-        maxItems: 1
+        minItems: 1
+        maxItems: 3
       iommu-ranges:
-        maxItems: 1
+        maxItems: 2
     required:
       - iommus
       - iommu-ranges

-- 
2.43.0

