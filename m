Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6442D3A1A38
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326486; cv=none; b=b+JTzxGmJjF/W/cFmljFqCKHPNfWb1ZjXFXnD7poZk8fAPcXkW7pkb6ax5fUNbk5JIxVEbZZbPeBtsGwb38Yr5xNJLmAlNQit+a1HMGaMH9Yfd9uFmzT89PaeUZe7t62wSoChKyz1lZ38lY120y6UFrVBgAMwSYNdzA2CuYOueI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326486; c=relaxed/simple;
	bh=T6NGPeImLPospjxS8/pCO+W9TSe73t4Y6Lz+PI/W/L4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P4h7ERnU9I3bzQ8TRmCXMGs1bvVHO55uMZx3fu0QHDWm8qUsaUP1aoei+Rt5P4osABJb/Ia1eNPCYLxzv+f73aInp9Z5EKTUx6VYkm7us9vPaV4jIG8GwIDWgAM+EpbUNpARMD4LMt40MpPq81IxR6TmrDp7rS48TyKlqxGys70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWqnxPLy reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWqnxPLy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeSo11029592
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DrnF+WzDhjC
	ZA+grZoIKVvpbcMd8nTjpbf5IDdeQS9M=; b=pWqnxPLyDwc60BTeVl9q4UfcwE3
	1ViwjEiWDGenyjOvk6jTy3G7j5WAZ16Cj6BJl1N1AhKST5mSqwYYPN9gbHnigqW5
	yiljH/cEwHa+qP1hcmqSVtG92J2W4VnjrPHlglG0p18Erv4ymPDpb4qsCCbLrAbr
	77QpKSgJgz9+SNy2+1fa1eh0NE8nsQUchQs6ZX/+xY4/1Ga035DckVYl5op8dGFJ
	C74pLjGEjfkjqyQ2DH0IdSI6yV17VEGAD/XcT3yoITErWrVHM6XuyQIVd1B+fdYf
	XhP3At8b+zCsmBrO3k8coajRvUdc8L7VJL/+dzTOhf+5jtroEn7mkJ2xjtA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ashu47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:41:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so641672885a.2
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326477; x=1791931277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DrnF+WzDhjCZA+grZoIKVvpbcMd8nTjpbf5IDdeQS9M=;
        b=aq/TnFEC9YwdKncxBmbsx69Jpbe0HH0u+hOuUAzWUHqE//I9nJ13QOR0EWiuE6Vk3d
         OERNcIkMQTNZxvhvgg7G7IXNxNNP6cA/YzfkFEjvy2MOXlEK3zIgQoiYPqq+jNwwyaPw
         GiV4s/Qfi1EMDsvoqFTlGeHdRu3vib254JdYWgZd4uyYJvh7d/0BYhAtCRBWFiuoFqHh
         hjtcu8puIeKKYlilwX80zzxNG4mcunwA+5opeKMj5N0kqgkajKZ/9MHTc6qcqJb7HVEG
         uUlnX7i/jaL+MoHMBAEt+gybZiZY6zdTzCC8EE6QB6/r0bcWMGUSYO6ACOO+BrxAdQm5
         v3/w==
X-Forwarded-Encrypted: i=1; AKwUvBwjWeRH4E4EstaGY9d9Ya5BJ+7hJGPVJa39GdUxHVE9bhQ4yDHKu5242zx58SZtUqsZVWmKfGE7s2wDCw==@vger.kernel.org
X-Gm-Message-State: AFuF++n+JPTN/bB+7mjuNaVUcXE1NDcGO4uERz+x3WcDVt8cAHWg6eTg
	9triSvq6JEhcXi/jlPfdUjGGaZJ0Gsqr4Vyy/uhrs5aABKomdQIhJ+xZ8rNRefdiI2gtjTuc4+F
	R8TgApq3ftXXTM6Mn3W1vBoFjTfmNaysSyEvjV7s4MWJUhj0lua+4MFju+Ry0kLsPlw==
X-Gm-Gg: AYBFou2zO2uUfDbUguFQE/sjpaEzbVZHpJYgYqEWLYIc9xSYCFacFT5+SNy6sQo3Kx/
	ec8DlDnhvJxOFrqAykg2Z5DHkfQoP3nrpMAxCItqxwzoW8FKvbHxSOSpr+HzaxdulMf8zStw4C1
	vCa+slg0MxqDS+jXoUlZdV2KCNck30NcaRxtVNtWMPQvRHpDCW+G8S0+yxyyCL3OwgIgdzB1b/1
	7NrxkaFpWILDi0NVaZlN4HpSali7nmuR1zqmRhWG4dA9OB3VGEIDKUH3hkhOyvK1dE4hl24UHNU
	82x7qtF5vokDX24iirHjAp293NMditXkUGWaPgERpVzXiimlwvpfNHdf9MM=
X-Received: by 2002:a05:620a:4486:b0:93c:5958:9de9 with SMTP id af79cd13be357-93e9b7c7f3dmr72920285a.33.1791326476817;
        Tue, 06 Oct 2026 15:41:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4486:b0:93c:5958:9de9 with SMTP id af79cd13be357-93e9b7c7f3dmr72915485a.33.1791326476290;
        Tue, 06 Oct 2026 15:41:16 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:15 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 26/45] dt-bindings: media: qcom,sa8775p-camss: add pixel path variant
Date: Wed,  7 Oct 2026 01:39:34 +0300
Message-Id: <20261006223953.3382273-27-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ls-x6AxuUjCmwJwUccjlbe2Fvr2TzpvH
X-Proofpoint-GUID: ls-x6AxuUjCmwJwUccjlbe2Fvr2TzpvH
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac5790d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=xOFzXCKjWWEJiKxN6jAA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX4Hes+1xMMvCz
 wCgsSCkHudzd5JfodeQ34XG349K1jYa6ZOHGlRzEFnD7vRg/kx8ChqWYlwKlRnYdX+2MbATqb44
 ibRhtwXa9mwzHpNTcU4cv04zm1CISGFWvPE6X2Ewp5d4zlIVUqzEZ6HOeUItxdBTZ71MeWtNr6M
 fGBmW9Bhb+LzkwSyu8RX8eRTTiSJ+KqSNOCakcLFerdoTOdC/A6qv9UBguREu3SbQkmOi9QVtKg
 antABHAPUj35P+2SbvO8/oxHwufwFFaOHRiyMrauUahFfFWfKKCaBlhOy7acAW1tVbDW6KU2djn
 iRIYbBjxlFJdrqCXppfgOTQSti8rUKvUNkBqFFnDDEitn7FaV+L7sqAShmxAwTaOlV6satDpK2m
 1SWB+U1iaaf52chIAwLfwbofks3vJ84Aixfs9vN7peV03PPmDX6zVnVpJZhCrpli1FNhFe18SFc
 IKrVT1pSnxcvWKlf2nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX1dg6kOJ/n+Ci
 E9psQ8SkB/vvvCGhW7mUqc/zVdiz5ntxXau8jI58QzHyXJ9arPkY752uR67Bf5/oQmcqyJvC8IC
 7IiWoSINeIWa+6rDoXA5yirsmspyNa4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
index 48f280e99809..9206c7cfe197 100644
--- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,sa8775p-camss
+    enum:
+      - qcom,sa8775p-camss-pix
+      - qcom,sa8775p-camss
 
   reg:
     maxItems: 22
-- 
2.34.1

