Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BF847A86E
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464869; cv=none; b=OKlp6wW1TaDpToYzTC4S4c63Dw1HEhJiIDfO1REgt6btLH3MYx2un4h9gAu426omrqcToI/mkdF9QQJfyzMygn0OVMp1oJMvNDOzBSsWsMUXDVPxMkbyg6N5l7N6RH0CJNSX65ghkPDvuncV5ucmkhEOTbozwGG7nCjyI5XMmbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464869; c=relaxed/simple;
	bh=/10Ksx2Yvqc4JVn1+zTLQ5sAht/bBwFMv9EzEJCZvRs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fnjdu5brTHEJL2Xo8ofUNWCAlprSo2JLmy8G9DFokqgg4nFZHCrhGCTMi22Nkur8KZTa0cjviDJ1ekt4oMHO7PHwZJ8TbzyKywxw9gK8fy5EMEHnpNGZqBBZpp/+PSkK5No/q8cCroAaOF2OCkl5ebe7f9VMgiPoIJEnhLKVbc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAiugDhZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLIYgUgb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAiugDhZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLIYgUgb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7fg2167839
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 09:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=myogxTp3zFT7QryrD+LRe9
	7nJL+Ptd3P3r3rqvvVuDg=; b=JAiugDhZ975/BQv6HR10maAmXgw4suuDHr9GxS
	gFLTplHOysJpb9nwYhIGTZq3hxqxPdCTumBd2PGD+UdZpSlSUbklVXtpnnU4bwrj
	CezaXoFYNHJWhwlSkZSW2Y3tpOKxL+KPoVGycm/Lq1KmmyUtSOdcnnvKzhiZhDoh
	NZpfBzhsLoRFAErZvFZC7H8zrf0fKcxXwf5whWuMcYHxuMuD7auErzQl0iKQBMdq
	1pI8OV/yWYoRsNMThDeRHl2uO5fp0jJMLhV3SEEmr5ugg0pRrs7xEXMKfE6T8xQQ
	2UIufFhnKKDN+Ssj7BkdnII2dZBWQogWV/BQ64mubCVOEyug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s9b66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 09:34:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1de6d5c3so438607185a.3
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464866; x=1790069666; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=myogxTp3zFT7QryrD+LRe97nJL+Ptd3P3r3rqvvVuDg=;
        b=GLIYgUgbz6iJLEHCqZrgL4dVBqUjjQeGkFfBuuWJgjh9A26fPoDn1u5mbaxgXibb9V
         iQ1o0EDFxwXvVwEBVRq1b9ZuBey0zqnr90cn1CWgIrkRN7RZhqISZJX171zUBAUCT+aO
         MgjXsDdya3WyQWXIoAsap48gZMDVy2xMaEDR1kjD8hVELqzwiYXee/huMcNJ6Q0yBzw3
         mlfZO6LP2n835De4sXz9xdUtEo+8caxWXTXypF/IVMvo5XdB5jIVh3rhpwvQP7cCjf/U
         EgAWxRKugNnJQZVScBheYroiRo8fw4lmafKr7GwkKG8Cj4EQbzN7cksnchZGwNaU+yX3
         YHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464866; x=1790069666;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=myogxTp3zFT7QryrD+LRe97nJL+Ptd3P3r3rqvvVuDg=;
        b=lmj/MZWfwJnzus/D16Vy1iA3IT3TRaqOQom7YWZqNAT54wmRlISiT1AUJhfGlSHmNS
         zfvn8XKFYr2cTl6q7blO1PAX77MbpbIfGP+0E37JYb8uJbJwaJSZAgWg3MC9abfNVpVq
         R9KWMG6S+tj6CT//U1dQZK09dGUXqSwucm5EPDJMDJ1Xg39SlX/RMUkYF2ogUXTg/7vn
         p3gcgx26meP1j4aH5y7igpgVcxZWdQz2vE8uYkc6FzeqoV5ZuILjGAUhE2oogDI0ti6Y
         vk3LgA9oKRH4x6jTvTSf+XPUAD+mzpfe08FtAu4mWnycT//+foitG/nMwvpDIPRyP77E
         vrkg==
X-Gm-Message-State: AFuF++kOQh6NUAnQOJydTQogsfpQggmet8K1wlxicgz95wykbXPSX+9F
	G0VqCvaHcSeax7d5VBNG0TJddCA2MQtBwca1jjVYRsnchlEuyodrvKB9EljsjPEP8sZtCMrd/d/
	Cirop/8yYXK3cr0Z5ZlEXsAlbEcJ/+JCuVmdWsiE2/A02D+5H1Qku3ZJX9Vob9wjmlQ==
X-Gm-Gg: AYBFou0c1fBcB8k/+eLXvZ9NDAIQ8IaWyz9vLMCPGQczJmnEPdkJKNANwriSwTCRQdE
	RL1/UZg6pe80JrDY1RcVqc3Q5IoFOpXq9FN6KYgwZV0SLbtFcOHEjxABstAuyMo2o1g++jUctSF
	BQbdzclrW8g7BZWq63rf4S30S6cP4oBNQn1DxHAblGtwBJAe8pRxtIKpn9pbOWsFhs2drAl2a1j
	nNj/xkazgt0Q2IQQhR459usCohDRIMfENVyjButnXlIMcjjT9lrcoPvjGa33LwwogsuCB+FYElM
	zhTao/EObAfS0BV8eqHMSVad9dhpbFyCb1TJN9q19hSzxeu8MjfdmstuXM0ukx8l3XjKpCCFpUb
	3FdSO7QBCkM289ONe05LU+ufR+bSfLbkCAVaWluszlrcLplWA6ehySRidrh/WqT1XSXZb
X-Received: by 2002:a05:620a:6892:b0:934:946d:599d with SMTP id af79cd13be357-93a29949981mr860092585a.33.1789464865938;
        Tue, 15 Sep 2026 02:34:25 -0700 (PDT)
X-Received: by 2002:a05:620a:6892:b0:934:946d:599d with SMTP id af79cd13be357-93a29949981mr860088185a.33.1789464865485;
        Tue, 15 Sep 2026 02:34:25 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a26921baesm447229985a.24.2026.09.15.02.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:34:25 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/6] media: qcom: camss: Add support for Nord CAMSS
Date: Tue, 15 Sep 2026 17:34:10 +0800
Message-Id: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABIRqWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ND3bz8ohRdC8vEJFMLw8S0FHNTJaDSgqLUtMwKsDHRsbW1AL1RkQx
 WAAAA
X-Change-ID: 20260911-nord-89ab581afd75
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464860; l=2579;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=/10Ksx2Yvqc4JVn1+zTLQ5sAht/bBwFMv9EzEJCZvRs=;
 b=9OJjBlsRy+U0odubIf/rqJfrFoyk6BskpxlAaTUXPN+L5vfHgBNbK8EJnar04Nhl5uP9F2Mym
 EDZpRzyaazMB0gst9chjVklRSXfiFHgFUXBqkNAs2EDX6DcADIreTFQ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX7VCcY1czTlGG
 WVXOTMwvAktjsHAkByuNGcXkO5FICe1YhVOGviKs8UA7fescTuxmmbIuJDyQJeNdLa4mbxCm61G
 YYkQHpDX1dyjHHY9f6/NJnJpn7gnEaQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX6f+X5BeUKGOS
 jQ8LtR34XVW3kRvIgR+22q/JOMop1mUc+rpc/XdV6fOc2owGR/CUaiF2PsV3hsImGkYrxELA6m5
 pv+6tr6wNBhRZ9zJVbq4u//69lJXSVDbOJQii1na9NBh26UzjH2T9BEr7QWwBUFcqBDyIVXrzCj
 R2xow9bO6WbiHanlhY/rfoeLgED1jxoL7EMmKVROckRRrssIPDUzKtPrrhd7FM+fqfhpQj0/T55
 UiARICFOO5vWSfCCPsnkXgGPA+xJNHavbT7ltG1NrNcwZ6i1SPlz0UBt72+mUyC54O3NOa68OS0
 WLadWJZc+ja5S92XLr1L3q8iXyjH9UcQtdle43Hd9AIBy033pSw70QDc5/h1DoePswx7grGTXtK
 mKG6k/T89eSNqdwaX/YcqfOocXtILUoeWTtAOFtzFOlGYPSL+KG3XvCKRfs4o53aRNQq2bGuinr
 J387zIPuZrwvi/NEzjg==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa91122 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=EM_g_5Nrotj72ms4Ud4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Xegju5c4xnACDgdSNkX46q1LbjU0ry2Y
X-Proofpoint-ORIG-GUID: Xegju5c4xnACDgdSNkX46q1LbjU0ry2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150137

Add camera subsystem support for the Qualcomm Nord platform.
Nord exposes:
  - 3 x TPG (Test Pattern Generator, v2.5.0)
  - 3 x CSID + 10 x CSID Lite   (v900, driven by csid_ops_900)
  - 3 x VFE + 10 x VFE Lite     (v900, driven by vfe_ops_gen4)

The VFE reuses the gen4 (Kaanapali) driver with a VFE 900 variant for
the different bus register base, CSID900 uses a separate file.
This version only supports TPG and does not yet include CSIPHY support.
We currently do not have suitable hardware available for sensor testing
and validation. The required hardware is expected to become available in
Q4 or later, after which we plan to add CSIPHY and sensor support.

On Nord the CSID domain ID must be programmed to a non-zero value: 
a domain ID of 0 selects an unmapped SMMU SID, so RDI writes never reach
memory and frames are dropped. Only the full IFE path is affected.
The domain ID registers are marked as secure. The workaround I used to
validate that the full CSID path works (programming the domain ID from
CAMSS on stream-on) is here:
https://github.com/qualcomm-linux/kernel/pull/1022/changes
The preferred solution is to initialize the value correctly in TZ, and
we're currently working on implementing that.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Hangxiang Ma (1):
      media: qcom: camss: vfe: Add support for VFE gen4

Wenmeng Liu (5):
      dt-bindings: media: Add bindings for qcom,nord-camss
      media: qcom: camss: csid: Add support for CSID 900
      media: qcom: camss: vfe: Add support for VFE 900
      media: qcom: camss: tpg: Add support for TPG v2.5.0
      media: qcom: camss: Add support for nord camss

 .../devicetree/bindings/media/qcom,nord-camss.yaml | 393 ++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 drivers/media/platform/qcom/camss/camss-csid-900.c | 361 ++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |  21 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 283 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 602 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 10 files changed, 1676 insertions(+), 7 deletions(-)
---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-nord-89ab581afd75

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

