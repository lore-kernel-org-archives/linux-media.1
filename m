Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FB354706B
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 23:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328720; cv=none; b=Qlb47zFRItTInx1DRwOZOibLqriLhEoyopXG899U1r/ohMOWH/VCgnbS+rf9JGMcPm48t9tsvi7Mtboi2G2/mxFjuykM9QVw5Vy2JQX84YoCw0yT7d7CiXBNf7Dqn0GxwuoY5MEvNXBkqkn7BUyyCIVP0KVwXoV6fI14jadoWSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328720; c=relaxed/simple;
	bh=Gi+0SxuObWSnypm60XIzwS6sBewS3GWrLl3c8ovucW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YA6ByAy8rMYNiLxfoss4arjwLtZjyaQI65i7tRqUZCZ2b1+rO9a0TyqQ23ozc/BUIPpFG/ivuduUplWyG9xNW32/5wKwBPqpOx2NbSJeKDiiVof1D1EZMhl28imJg31yAApf4KQGWKT/ynqiCAvsQtggkKChtjbwI1Xot2+73/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4YkFYEW reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4YkFYEW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LfEdq1677668
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dlWq6Ov7H3Z
	qTYXe03p4byFmP3iR8MTu4occ91czj84=; b=b4YkFYEWHpZSLx5mRyl9ORf6ShS
	teX+9yrJGcDWurg2YjymA2+FQ8bJO6HqkZMXxLeH7m4fPSgnAT0cTZhSDrgq+/vY
	gpjzWxry9JawYaJdmPH70I5XURsx29Smj0GiBTJdGeXDh2ugeBHfShzT5N6iDE+5
	ev094OKImxaMSQLJItgEO07U2bOy9oaqdO3vdrnjLZT8+RFq11XTZI6DfTQ6kVtQ
	RncxQvbOXXU2ILHz554rldn4vfIgrUI4cdXP9QDgcmWo2KSCfNxBIMSgKcguHAGE
	vD2MTRdMWOi3v8UH5djLFarxDnyDRnXs+fdN6axYAxhJJerJRWWPrUbiPJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xdub13n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:41:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so600369085a.1
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326516; x=1791931316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlWq6Ov7H3ZqTYXe03p4byFmP3iR8MTu4occ91czj84=;
        b=uhnV/00IzMMW7obqQA4B/QFeyoIbxNuzKG2ogX44QYL6cga5xm44BMLiPNgIlE6ixf
         mq+jqaxXiB6Mo0sQXFIJ2iz0axxvmxpv/T+q0WRikpgI7PujyNRnpcbkOvHdcuMSXg4T
         PszepFEQ4S7OOIu58VVKE7sKLOVyxY7BayicwC/I9uYb31f+h8zHAGKr1sZQnzB1GsyE
         vbWuNi+hk67XgTOMyQb1eiI/4qrGX0kw4IYtJZQVE/7nTpF1/kmZDC8c267MooQuG1K3
         66U+pDLIehYnifMEufbe1aWRuksZxADdDXveHksRz7iw5tPnjfEpGg1j4O3IShp6lx+S
         e5Og==
X-Forwarded-Encrypted: i=1; AKwUvBx3itY4ZmXCv6pJwW2hPUIPtoT5kr9QkLrI+CKAvgWTZHoTClQ1fPixmIKjKum08U965fln15n1usmJKQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kSbtD5u8+WUTQER/A1F3OULAwsAVN4MDz/cn1XxpymReuGAMH/
	BwxgD0SgG8yQlJ2+W0qg5GakahsgFg46PRgJicerZ2l8x92DZHEFD+2fIQ9/pArWsdXsmBeG/Tc
	S8bfVvCmc13d1KXIcTYdGcXGkKryf1UdN43tGZlf/1u55EsfeATBlEkn4Gr7BOLRvMg==
X-Gm-Gg: AYBFou00Rn1WqHt9+g0ddgyuFbG6fOhqt1t4BiJvNyPY0YKEhb2GEO9Ug6Weuc3ORd7
	yOXuquS11u3qSR/tuXxdeyNim91xa3sMYK+u9deENysbZQ+hoow0DN3rz/7ukpvO3+4URNIfkha
	LkUvyoJs2Kw7xWj6NDkXzgUlWcYFVNJ8rLMOhnPMbPwOZOx8by+DLjhjsea1Hxpk3RsftYUprtx
	vF4r3A4OnMdGwyBJUou2prCh9Jha602co0bO4PdgnUD6GLOEcDWo0oPWihKugE9E6xYvCNSAKps
	Xfrs8fSc77P+eQ+URaWaKMDBckAM5ziJ4pDqpZvvy4l/s1K8kSF98iJm7l4=
X-Received: by 2002:a05:620a:40d0:b0:939:7683:33d5 with SMTP id af79cd13be357-93e9b71bf00mr86273785a.19.1791326515423;
        Tue, 06 Oct 2026 15:41:55 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:939:7683:33d5 with SMTP id af79cd13be357-93e9b71bf00mr86270285a.19.1791326514991;
        Tue, 06 Oct 2026 15:41:54 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:54 -0700 (PDT)
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
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH 44/45] dt-bindings: media: qcom,qcs8300-camss: add pixel path variant
Date: Wed,  7 Oct 2026 01:39:52 +0300
Message-Id: <20261006223953.3382273-45-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX70wSlGgVtDgD
 z4LSwWON8FLXcux4w/BrMcQx1g0hKa+EA/rfehdzgcYImBTq/jXUX4ro1S82GNnV4v0VHWykmFi
 7pftlUr7+9aa1YwHm0xY7zkmmikIyxU=
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6ac57934 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=TLHcO4L7ZdRFNAOTDMcA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ImIsKzrjnEL4nUd50Qx_K6WaBek-HO48
X-Proofpoint-ORIG-GUID: ImIsKzrjnEL4nUd50Qx_K6WaBek-HO48
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX33Wy0NZwpPMD
 fr8zZ2jSb4nipKSNQiT0RaA2oIUUPrmxymkMY1vKT8AuMYi6lbSsq13FRiTHbPrJbCtvyquar4n
 wCn9YjzVNXle751znFBR02ZeXV9Idxy4xHbbxbAVMpgIXOHaFYEVrTTWKhX3zAMdp0KWOL42tsH
 UA3AyQKekX+NMQzdOgiqbK1zOezT/TtQHXT/TLnxo5Ois/81E8TcNBbC6A7cye0t2h+8CupTkxW
 kNvJO/WnOVCVLolntFeVAxsc6xM53WJ7q7Sh1EyGJnf1I7tMttVANTjKlrgOk8KjlVkwjRXPymd
 ggb2es0qraEKiYNPrWFWWzEifK1RqApq72BBzPLv59fvigXGzbqYfBoFm8Bj76al21iU8SL5++x
 LozOxBKPDvR6RPQNdmx9DVttpvxHrh7QGo7fW0dpq3V1Bf3hwml1TJjJ6XLKVvsieN6qHDRMPLR
 TMwL0ggvWFb54EyWsyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

Document qcom,qcs8300-camss-pix for CAMSS configurations that use IFE
pixel paths. Keep qcom,qcs8300-camss for the legacy VFE resources.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcs8300-camss.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
index e5f170aa4d9e..f85104682e52 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcs8300-camss
+    enum:
+      - qcom,qcs8300-camss
+      - qcom,qcs8300-camss-pix
 
   reg:
     maxItems: 21
-- 
2.34.1

