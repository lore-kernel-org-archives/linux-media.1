Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804813ABD82
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784330019; cv=none; b=GqMLWsRZRTaxGJ98JIuO7Ke7tvP+yEf+OAm7CQJnIXqJVC8NPnCGGt83Vs6kCk6FjeCd2RNbU35ArJ3QaOT+HGxMf4pUboQ2D7MwoBw8rT0Ngo/UDPOthzpIW68Y0keWZJwC30OApOSA9yFudnhXnjEcoM/DeZODvb6H8F4BJ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784330019; c=relaxed/simple;
	bh=Hrq9ooj07d7KSBsbP+6CKiVMGL7EDngaZJ/FHtG1PAk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W0Vl8ZhFGcQrowQAQJKq0xXwkQ/A3tWHks5ZQ/yHNw7aN1rFNxYooKu5Xy3VWZEhBH3Wg122VB2acfoBB3vrRgh9gMszS6EGlg85bgr072s2gh9cuXM065njm18NBy4sNcVeWaAywav/rP7Y/sCAb/Hj5MAxiFWiuD5R3SGaPi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVU7GOca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dXKi6DIs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVU7GOca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dXKi6DIs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtWmG2906324
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CuIes9AoHpQA1RqGyTqyeC/F1pfUSMyXoGM
	Ky0qhZGo=; b=MVU7GOcawCgjJh+4m2o8fBKBS0L0K2XpdSr7Sk30kNe/sxOgis2
	A4mVNGD+hFH/HI7zSb6pY26Qkrh5oL9/Yq3d75OpHr0/ARfDmlsbTOVy7fRItYj7
	xCpTKj5mHRCVcBJKet6MgMzuxvSubPoKilRKWM8hfAPGEUbFsdKH/idS6xUyLavL
	SnSXSO8rhf6eQ1giOMWEZpra/cunxoOXo30FuRScrpEZbjrJqMc5IZZe5Z/g4y8U
	ydakKLJ6y0GqJqIGuJvCjff+c0XgbaafuNTyrnUGdmkXaiRy0LCIAD2xReJ9XXlQ
	f9+rdiYeyLAVK59d/bRfVE0n04T7BR5N+Rw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrsq950v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38c7e26ecabso4710592a91.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 16:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784330013; x=1784934813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CuIes9AoHpQA1RqGyTqyeC/F1pfUSMyXoGMKy0qhZGo=;
        b=dXKi6DIs+S49S8BU9SgH3Bg+AxmAJaAm3dxicHeEWurU81KNDIl7upYJFW8V1R0BPL
         UWWJiyYJz/jvLxTMy7TOLhg1sSewMyiiEGPohUj0hx5PFK/NX/hCEC7MrgffUBBkjgh7
         zxhbDVX0iyqNdJKJ8k8j+BYzEp+ANDoI/Zc2vNyXesPf6y4VtSki9NWDCG1xHN0JN8e7
         YF6YsPJ5VOa6TwimUGs4IO/UfUi7w2PWp8VwUyVS0p28puJB9Jb/y+YjQtx8ZPDI8Xfo
         OjH6mlyeGSr7hHvhBJUH7ScdEtiCEkLXo+9AZSaUOwTp64CpHok1nNFgcmVgqrL17PQo
         kViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784330013; x=1784934813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CuIes9AoHpQA1RqGyTqyeC/F1pfUSMyXoGMKy0qhZGo=;
        b=fzFFuvUUhmFKmGtYMsI5S3wrEk669D3JlHJGJIeOKWw79gNByhyC/peY6sv18QyGjX
         3mMQLpN/HP6AyPj/hk585N4Q10HUoTkD0NMBgZoq5/cb0zc/CzQi9ujtIlis3HloF6fb
         A6Ugr3Q2bo9XwXwpy96gPw9es4kIQjCJgCnAAqkHwFvpWpZfXh4Eu79AL8yvSwYrTd/T
         wucEi+XY+av9V7bjQx6nxs/tNh3pi3OC/lI3Tj1NSyBzSZCgHErU8VUESTUDet0QaZnw
         K+9l6a++Ru4LEMQJqmLvx+wUr8FkqR+cqOIMTGMNYmTKhij4wGLytxQm8M2bNBxrfgs9
         cWBg==
X-Gm-Message-State: AOJu0YxpXwCWRh+U9po6oDvaxxon2nu3IBuEimBK38jRUOf557dKSJq8
	cja4AHqohmsqBK/6+QWBHPzwIBN9o9edjJdfAKSC90S7lGFK5jDm3m4/0LwV1Eo9yGYaQG7na2B
	RNODMVhNYb6QZoYaw6vUAkVyt6Um6jf2KfelK3Jz8kjbcJ3WQpConZ3pXP8ztfwAze3vzv42tqA
	==
X-Gm-Gg: AfdE7cnR1gmH7vXX2aETL+/fg+26RY/dr7HxBeB5atcARSaPqVBuUeL0S1EWZMSncUm
	cygdGR2eERkMqK0gPkNvIlEsxoXopxozazqDprBC4H0f33a5DkYcN/QGKKL5juRkRzs6DwWDbIo
	i1m1KdQT5oHQKv9B6mS2LFsFBYuom7C4/cmh9Vi0gR4Wu726fkPduvRxF4eh2pfV6lNUbJCmGkC
	Ly5uPqWpzWDBTzJVm++DJW/D1nW08/Oi+nrR/Y/soaH0p+jAhf9KfndqHM72+TYn8N8L4gJMa4C
	DO7aLgpVr1393a9anoTD9a96S10lEr8klP+hska+DKH3Vg9P4aSCCcpuCLihDDngRZMuSd/1QV8
	YhfCPQy7/5Bi0bzY3BXso7VxWate32Teped5Hb2/BMDbdlDsvS3kpgys=
X-Received: by 2002:a17:90b:2f0d:b0:387:e0db:bc33 with SMTP id 98e67ed59e1d1-38e4b5726e0mr5062859a91.41.1784330013505;
        Fri, 17 Jul 2026 16:13:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0d:b0:387:e0db:bc33 with SMTP id 98e67ed59e1d1-38e4b5726e0mr5062834a91.41.1784330013004;
        Fri, 17 Jul 2026 16:13:33 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm8145264c88.8.2026.07.17.16.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:13:32 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: anusha.nandi@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com
Subject: [PATCH 0/6] media: qcom: camss: Add C-PHY support for sa8775p, sa8300 and sm8250
Date: Fri, 17 Jul 2026 16:13:25 -0700
Message-Id: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfX1bKQryiohaJX
 Sz5VYeraP8czCaAhSzDOQ44vMOQ0JjEtskY7loRgsEWYqyj6FzhjjTqjyHm0QU6EBtbZVhFGZtv
 Uq9xbPwFZSkt0QWQ7v7TVLL4kTWgdXA=
X-Proofpoint-ORIG-GUID: tu4cwCwAEKu2-6tou0I4fvRhC6gQfa-s
X-Proofpoint-GUID: tu4cwCwAEKu2-6tou0I4fvRhC6gQfa-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfX0W6JSU/0MhVX
 1C0cUGjhPFotLWSF0MR+iBoFli0pEYZ4g/yBdi+zIoVr2+VDmzxM+Lb/PC9i9IAvIvBzdURE+SU
 7slV6S9OJ8aAAPheeAv3ByFD6GHxeAzgPm9zn1Uw1uYjV9YqsjTXQp21xw4Yz+NvblF0qE2F5jW
 GZPiQWBzzZm9ivnpdOo+F0nneCMsuUozg3eBfS2BDOYBrMqatwZfoKRlXQMCrSfZMArz4+386AJ
 mi/k9iJfSRezkzzC6OvUXxLzhULNGCuz7mQQe5epDtOQpe6dNO9xSEveqPZrt47f2C1bikjAuU2
 IecZ23tIEbBFzFoVkxja9oD+1IT7RnGbfUUVcXZkGsaFMA7kaIsyptPXmaOBrXrhzO+aVAkqadg
 0EbvJLox7WKmb9Uxs9P4cCiUxOJQnZh/OQM9+444CqQJ8xALhoyYhyidAtQUkbWW61i+b1xk4vF
 XR3DKNeAEmuUGQZZyLQ==
X-Authority-Analysis: v=2.4 cv=OJIXGyaB c=1 sm=1 tr=0 ts=6a5ab71e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RE83naAZxIoHJT4xGO4A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170238

This series extends the Qualcomm CAMSS (Camera Subsystem) C-PHY support to
the Gen3 platforms, adding C-PHY mode configuration for sa8775p
(CAMSS_8775P) and sa8300 (CAMSS_8300), along with a dynamic, data-rate
specific C-PHY register programming mechanism.

It builds on David Heidelberg's C-PHY enablement work for Qualcomm
platforms:

  - Program the common control registers and prepare the CSID RX path
    to select between C-PHY and D-PHY for Gen3.
  - Add the sa8775p C-PHY 3ph lane register table and wire it up for
    sa8775p and sa8300.
  - Introduce a data-rate selection mechanism so the C-PHY PHY register
    overrides vary with the negotiated link (symbol) data rate, with
    tables for sa8775p/8300 (1.5/1.7/2.5/3.5/4.5 GSpS) and sm8250
    (2.5/3.5/4.5 GSpS).
  - Validate that the local (CSIPHY) and remote (sensor) endpoint
    bus-types agree, catching C-PHY/D-PHY mismatches early at probe.

Rebased on David Heidelberg's C-PHY series (v9):
  https://lore.kernel.org/all/20260617-qcom-cphy-v9-0-83da8a8e4e44@ixit.cz/

Tested on sm8250, sa8775p and sa8300, on top of the v4 revision of that series:
  https://lore.kernel.org/all/20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz/

Anusha Arun Nandi (3):
  media: qcom: camss: Add sa8300 C-PHY 3ph lane config
  media: qcom: camss: Dynamic data-rate specific C-PHY register settings
  media: qcom: camss: validate local/remote endpoint bus-type

Jigarkumar Zala (3):
  media: qcom: camss: Program CSIPHY common control registers
  media: qcom: camss: Prepare CSID for C-PHY support in gen3
  media: qcom: camss: Add sa8775p C-PHY 3ph lane config

 .../platform/qcom/camss/camss-csid-gen3.c     |   2 +
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 394 +++++++++++++++++-
 .../media/platform/qcom/camss/camss-csiphy.h  |   6 +
 drivers/media/platform/qcom/camss/camss.c     |  28 +-
 4 files changed, 420 insertions(+), 10 deletions(-)
---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20251109-qcom-cphy-bb8cbda1c644 

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>

