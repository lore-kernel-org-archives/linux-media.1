Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3221136AB56
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 18:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447509; cv=none; b=jXpszF0Wgqtj6anzGao05iDjM9gAxp58JXtcDjpTa0Q3MHLLs176KcZz6xMI8wDehu+EvhreLCZ65gywYH8bZ5HGuUOZ6FrxlT/7CNe6JrJUB3OTHIlGBk/MsFEzLtAtQPkl+pUx5+W2PFNQ2dFczp6onpqa34gQSKBkMe6ztdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447509; c=relaxed/simple;
	bh=cRx5VRxvC0xJFx7V+AKfA1cxeBj5yF/qE+7MJz/4H4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TloYHk9KdQ3i9VjChbPB9zS4qdvcWBre1WiiAIgso2xViKce2av0EPeQrEBtFIEJjFSZ2n+1zzDVm2Eu7Jw+NchsFQGD13qdFjNV9DzTeCMEI/Xa/YINdsxnCpj7I5bE7Y9l1+PU2a0/iWGFm7aVdG+uDgy/oEZJr4C1gwAX8M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOYiwH9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YuZyDRrC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOYiwH9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YuZyDRrC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxQrK1329820
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 18:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JdPUDZZT+WDdxEtZZi5YPAJFXhlxmleL6Az
	h39mMkvM=; b=eOYiwH9/nH5zEcu5AbSDDatmiUr7DM0jTc/7EkEJNb5TIl/U0Dr
	s80SOJGcovzGB4yz2VymtbjxC14QJ/58dAb4+kUQXhUUiebYAz277Nkx4BjlTlGX
	o09YKucrnSQ1nLB7XwI4XyU8U2XS/kv/88tSWgvmhkHX5mTMD4RJ8K6ltHhZzk01
	QQK38mqxGrSIhaOCI+99pL7pfiEaezV0UdIMd1PKIekUOiVYEAT2Pze5re/nlKcn
	g25ON3hnOT30fQT6OGnjBtkD10KUdYpl9CP5mWOTVii74Hhcb3VHxs5usyjuGVMz
	O0ri7I9IzGA567m007xDePtqrOyS5oYxiCg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx50s9mav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 18:31:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1011542a12.0
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 11:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790447506; x=1791052306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JdPUDZZT+WDdxEtZZi5YPAJFXhlxmleL6Azh39mMkvM=;
        b=YuZyDRrC7e3GAFAh8wC0l13t0T92PkKo8LYjsUoySpbtcV7mIrpJKJFP3QB3LAbtu+
         6tSBPgR3MLG/Q38uqSb/RvyGlKzzAKnfhexeren+pyLqTsNqGi2cnb1f7+5MkWbGWpGT
         wnyQnCRkYoVRFUW57GqUuWVGjKdus3kb8+STaarNx0Goz+5CtTadYYCSg1L0C9ZHrKqn
         UIA3fg259wKImj7QfrOt+GaOc5Y1U6YmZpUe5WP6G2dbmdQw45rOvhqgN8yHAHXNhKQg
         6uKahou3y/7BwBtrJfnqUGK2M6JiDFRAAl/FClNxM4tKR3WQwu2fqkqm8LMIRmYaMY6j
         CJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790447506; x=1791052306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JdPUDZZT+WDdxEtZZi5YPAJFXhlxmleL6Azh39mMkvM=;
        b=bbQCgAm1wIKrKlFHtVvMXKX03Tx5ZtYRTGYvwR/KDKxBxxNe4XekvuN8AWtQNr3uSW
         0/96xGm7STnITfJQ3GKGekotWNyPvLs0BV3vmatnq6x6jxQfFIdTixQKnk15bLV9Jrkf
         NT0UlLjxb7egnmmx3T63cgn/vazkCX86rz2FE1up/d34/cMES+GJGp/hn/ayUAkr9s6e
         XzP9Bj8WXKCdso01hsYNTrPrjhNxGThHTjGDTDqck0eQW+zxfCyorH89VxaGUhXvHKMh
         zTKphKJNcVNZweVEck8fdS1DgPZa+QlPa+RbF5Gwb7io9LhbxEu4aZV5Y83LKGYSjmB7
         4miQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0DfLoBjSMofeDnZXrCTLC3fA1XOGpnMWzPIjvPfajfGtd0JCaRfhmSTs7ElHX5efyv6whufsmQAJVGQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m8M8pbmHp5F7ldiJm5INoDqLTZRrKpQdMeHC+2mB1ZgmnK/xoD
	2YGUD6RG0LpINEtlL8DkGGEh1OnYdM/6XPM069f4UICMXHBbQsvvMIaP8su9END1W2AIyyVkSwD
	QS+UknM8AHAfb7/MdLD7kJjOmFaapmC6hwynh2YuqHjJ5S3bffvISqf522ELFK4TU8w==
X-Gm-Gg: AYBFou3T44F9OTUVa1fGcMcJqkUH8R5wizslAdkjZ4B+lx44NwF6zJtWQBqXpM8Abm3
	h2ef5GwsM3AoGigw15zp8h7LsLOXQQrfXSPbHxOrMpegrZIV//HMXxw6+2ja0wAWDUiWy1OaGVc
	2J0p62vtzwFis18RglLvnfAWL8thqU9uJNsi3g9XxpbQ3Ow9PwhufQAanDATGk9ah9hXb3eK1iG
	41xSuPIP9VrHFF5id7jwwHUh4/arOhJYsBhrxDHRzuzMekvXCuMFFrtMOWdccsr7Ee8Uxnq8kii
	0n1Y6Oz8Buk0iTNROhg+LUi2xU8X7QbeK34uDVyhDMdmZRK+MyU62KHc6+DcvAeWanZw+20rIva
	9r04Rweiq4nHChooveVh3F9MTsLllpRm1j53CRLitVzx2lrk=
X-Received: by 2002:a05:6a20:3d09:b0:3da:bea4:6219 with SMTP id adf61e73a8af0-3de0e75e925mr7709826637.20.1790447505793;
        Sat, 26 Sep 2026 11:31:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d09:b0:3da:bea4:6219 with SMTP id adf61e73a8af0-3de0e75e925mr7709807637.20.1790447505363;
        Sat, 26 Sep 2026 11:31:45 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c680sm2539983a12.16.2026.09.26.11.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:31:44 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Andrei Kuchynski <akuchynski@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hsin-Te Yuan <yuanhsinte@chromium.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linux-usb@vger.kernel.org (open list:USB TYPEC CLASS),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Pooja Katiyar <pooja.katiyar@intel.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 0/6] drm/msm/gem: Drop use of pages for imported dma-bufs
Date: Sat, 26 Sep 2026 11:30:40 -0700
Message-ID: <20260926183051.25754-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfX5Y2MYnDeUmoy
 fZczxFnz4++/Jm1bUtCXltJrgAR1HYMGE6fSCymr4l3CgQ8+dVGUxEo5SthpTWVHYYavYvVadR1
 GPv0GY3MZ+uUSM2bWAp/se3geiG6+PQ=
X-Proofpoint-ORIG-GUID: -KExNg4hHADi8aPDzCaREMTlsXKBlbCE
X-Authority-Analysis: v=2.4 cv=WuK+otfv c=1 sm=1 tr=0 ts=6ab80f92 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=tIciJ6vaqEqC_qAMQbIA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfXwfsWlJcU49z2
 GXijqOAOoi9zpoJ8wfmKrDj6CXH2wzbPaUZtHSm55Nd7AWGTQpWFDyMMkxSUp30TE8nBVUkteX9
 m1HU85FpWb7Ey5Sdx8QzpKBq10Bcb0EjXuduqnvH/zWikHa0c7LkxxhbVSooKXafF/OAMRp2ff9
 +Cb6Nn/5O17KHl7ZLPjfpjRAT5gI60I6SosGwpUkFfIQltR4dHsEbl74Mvjese5SycXNhcGi5HQ
 u4n8gRF3++usnUXFhOiBM/m5JX7tGrLVaVjdT3Rt6AB03JAPYIEjJS9NDci/sNkXTBah8T3hd7S
 Za0I32K6tTxy25eISf1OigQa+vvjUVmaLwmaDwR3cOXWRuMArHWAyRySblZz0hPDYNuvD8v2Die
 mspAMeKpwf3w+uZDhVtEvEJv3syc0LpWzmLdlQYJRy2XCjl0U4Fhg3OwVQ6Rbx7RtbHVXdRqw2b
 zkQ6RT/PbDOu99brpIw==
X-Proofpoint-GUID: -KExNg4hHADi8aPDzCaREMTlsXKBlbCE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260073

The use of msm_obj->pages _mostly_ served to mark that the obj is
resident in memory.  Mapping to the GPU, etc, all works in terms of
the sgt.

The exception was the fault path.  Resolve this by using dma_buf_mmap()
for mmap'ing imported buffers, like we are supposed to.  With that and
a bit more cleanup we can drop the use of drm_prime_sg_to_page_array().

This doesn't solve the issues with DMABUF_DEBUG, mapping to the GPU,
either via iommu_map_sgtable() (display, and TTBR1 for GPU, aka the
kernel managed mappings), or msm_iommu_pagetable_map() (userspace
managed mappings), still requires pages under the hood.  That will
be harder to solve.  But this is a step along the way.

Lightly tested.. in that I don't actually have a good way to test
importing buffers that weren't first exported by drm/msm.  And I'm
headed to XDC soon.

Rob Clark (6):
  drm/msm/gem: Add helper to check if resident
  drm/msm/gem: Mmap imported dma-bufs via the exporter
  drm/msm/gem: Use get_pages() directly in vmap path
  drm/msm/gem: Stop exposing a page array
  drm/msm/gem: Stop calling get_pages() for imported dma-bufs
  drm/msm/gem: Drop use of drm_prime_sg_to_page_array()

 drivers/gpu/drm/msm/msm_gem.c       | 107 +++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h       |  10 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c |   5 +-
 drivers/gpu/drm/msm/msm_gem_vma.c   |   8 +--
 4 files changed, 78 insertions(+), 52 deletions(-)

-- 
2.55.0

