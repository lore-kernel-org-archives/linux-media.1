Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AA646A5F9
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 07:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247891; cv=none; b=Axj/WDXZqk5JTrXIIa0f4uU8rWZhlxyLa+nSnf5xT8P+/BnumJA8l+Q1MOIJrNbkf6IwOwHlI2gUu2Da5oUV0u07G2uWctcC4UpAntkghu9B7Fc2dZNYXwA5I43kFhxT22G9uLRBcxKt5Rw6JTE0Y5JwRPNI8HcxUqT1Am+yGpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247891; c=relaxed/simple;
	bh=uBZdxUSbidPUR8s5YEFI7Jz6Erg/CEjfOa412pkfNDI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IHb52i+mbeMde50pAWlfTK5ESeaojwtK150vG9+sQcfhofjciBbMRkTnXSpE9Rpsbfg6QYusta6erpthGTftggZwQLG3Fbmk+0/oouG03sDv23O3t3aKEmkbHEZ3sRCIlHNwHzkC+JFeXabGtWVsKtCjPNk34bZqnZ6rOdnUVS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdpSuVJ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOPnRgIi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NdpSuVJ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOPnRgIi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179CxF2061558
	for <linux-media@vger.kernel.org>; Tue, 1 Sep 2026 07:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+90YvACKrGhNGFC3jO9C3x
	PTwtrUvuxLMFSNd/WpkuE=; b=NdpSuVJ2EiNSRzoZ1SCLzjYVDWdxG2epxubq0j
	jP0FEfsGdv/2NilHpXcS/jVao88tLjKg+vNQj5nnVUrBNl0tELSxjv4xfag6qRQL
	XR5mMmWC5vnsWxsq9zewPJbkm5bZu4HpnLOX8pCAMUFMK4lFqyln9rZ7FEgn30O7
	TjBBssE/KkU+fwMmaXQA1sp/SzO5h88NVfaL2RyoBNExKrkz8wTm6bg8nWSOuePj
	DBftsJwXcHRCcfLTTtKQLoc7aZty7T899G/yBm43UG3DjHONwyv4HbOWiDqfoUYh
	7ufefRqDwLG4AdeaSGh3zkwbveQrqATGewKFNLtapX2aO6Cw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0s65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 07:31:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so126725085a.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 00:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247887; x=1788852687; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+90YvACKrGhNGFC3jO9C3xPTwtrUvuxLMFSNd/WpkuE=;
        b=TOPnRgIioChDz5AO10O+4r6pZfTLYJlRtFFbSLdXF12+hkf2QfU+StJW2OKmrhe99V
         9lV5Vd+zUuVPfCUfrE7CdcPDzSyh/Vsy5BLdYSjeIjg5VSBxcAvrewzPTcPOB+oJHWIc
         o4m1CbB9PXqoTW3P0OY5vypWMwf4dBTUQonIJtiv9HG1GOnB9jFnxjTq+2j00XaLMbIj
         8AM39k0BWydjiGAxcJiscJ1Y/fYWfV4PYLYPOeSb+89oMPj/FR9UQ3HI+fz8kIWLHTZ3
         0r7YnwtPoRcg2JrgLY0EhG98c2WDomv2Jme6OVqsjRI85oYmbC4CNpDH/1LfRRLBhghm
         LrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247887; x=1788852687;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+90YvACKrGhNGFC3jO9C3xPTwtrUvuxLMFSNd/WpkuE=;
        b=NUjsz7c2VMZzHQ7PhT3ew9tLyR5LjGtl94DsMpoKUu+1zjcz5AHTTIF/oglsj01+Xt
         CZyOtPRc6Nsy4uTWJ2VD5QlufRhFSBtIW3Kd9AvzYoBDdxCjSbkjELnbxkIvpsS0C4RR
         4XIsQoN/wzPQfxzhPpfoIO1137aWR1JYAgJqJaiw8e3S7jozEwyxiuJ87+CKl7aOYvi8
         oAetR1PMF9wrleVoCxlX6ebkYj+auavHJvDyjw0plPzWypTVKhj3fuMdXYNgcvAubwXs
         Tobi7WQ30IZoTvwMsH9sSvib1tr5izPIXutpl7A9hgs9JgMdWhlHICKhCzZDoBt74EKy
         b4BQ==
X-Gm-Message-State: AFuF++mrMEuwMv/ZEnRRwNGefp+g6+ww8YWJIteO6CGjfB3TqviqhFqS
	VTokeT8tFYlmt4lzSLNLIjoPvRBUo6v1rF7w3l4Brhsb5B9ThE0v4fdmbHgDWINktFC1wCHrZ+a
	Q9kvGZOPxcNMu+QBqlkBCSnipmT2AMB7fQ3DwzLofaLLkb3qbEW9aeg9QrZSzuBtNrg==
X-Gm-Gg: AR+sD13/ywKWNnQtBEO1WHQMmtVYlYYYeIZ5ua8KwAlaK15bevOdZtwf++OIqCKdDy0
	FQKurtP5leBFaUIh+sIsfGTj7F9bztTDkN2s9aR7ydpj1K3CYaHctNZn2NtuyXzWYCxSBF/wzdF
	OceWGnhZogln7sVxA/mipS4NQdBJYcLLcxY9o41Id+D+nWhyMZJ1XP4Gb7gAnIy42o5OZdDUHM1
	5a9qIhOv1xS7I/ODM6vtEtO/YiRdpceBTzIhKQ83vVwIHVfS7TvKorg32c2ehkw6CbASgqC/YFl
	ylyNuk5NSWuxvk3i6Ss41a1KifM2n1mwirjVaROkH1oki68Qi+uM0aG68X2RmQ7R41Bwl8bWwpL
	wMEWcQOpVrXPOG7iUsOc1tFSHrB49+W65f6v9cK3A63y85Mo0E6qpAqlHnEsPGPpm0L+1
X-Received: by 2002:a05:620a:271c:b0:934:a1e4:cfee with SMTP id af79cd13be357-9394bc5bb71mr504601385a.11.1788247887168;
        Tue, 01 Sep 2026 00:31:27 -0700 (PDT)
X-Received: by 2002:a05:620a:271c:b0:934:a1e4:cfee with SMTP id af79cd13be357-9394bc5bb71mr504578085a.11.1788247884811;
        Tue, 01 Sep 2026 00:31:24 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93918b0f825sm946766785a.40.2026.09.01.00.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:31:24 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH RESEND v5 0/4] media: i2c: Add OmniVision OG0VA1B camera
 sensor driver
Date: Tue, 01 Sep 2026 15:31:03 +0800
Message-Id: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788247879; l=2311;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=uBZdxUSbidPUR8s5YEFI7Jz6Erg/CEjfOa412pkfNDI=;
 b=AI7/A32JN3z+3EknhLhlMjgy6xq8H3c1YDlpW3OSJz6woengqrE5NVzrUH667rNmiu2R+yth+
 dE6RsoKI6ALDGPUDCDUem7rNjl8i5B6oiiyx6J826phjGFCCR/i0oED
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX3FDsRHIsfyO2
 FMS0iaKJ3K64OHryCLEWsJ1p2QTbM7bmtW/VszDtQ8vtEOinLuvQrMkIup3Ek471cncHS+v1tmi
 M58iQzOsVJarMao5F8cN2l5+GPN6AZM=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a967f4f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jfyOTsDdjuaVfMw2EzIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: vK_tdsp3tQ2vOe-cgD0rnNUdRdTD3hB-
X-Proofpoint-ORIG-GUID: vK_tdsp3tQ2vOe-cgD0rnNUdRdTD3hB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfXxFXxsaVL7pGv
 h5zVZYMOVf8mAoBQ8RLTOUMN5G+sGPaoJIRFN3MFyPo+N3qFzZzsHiqZieUu+GyEZMHGS7XPUjv
 EWcd49ztHtQ35c//qf4cSguP+KQn/dIfz0YwZdx6VBOXCcjq9O7H/hXvXhrdnF1Twx6cwC8bnei
 FP+D6Uof80HjLCcTgMSSpWkG/Pox4T7KvQVGX3RKG7LBvhQbgG3ayujmpytMPtR1HElq6WD+SPi
 W0mOtPRl6Jz7eID26Ot6v70qfr4GEBjpnsTB/M/ePLE4nnJ11mfNBC0WZP/yhoKtlqy7eXMwIBv
 +z9iXeTJutCBrG6xQfXpEl7pLOKN26jBI7YJFCGNJTpz5ec9aenuhEdvq/7gJiWdVPYyZykuZWK
 7nlEEE7sCQ0Vuv9rvWnxVnGTGf6LcnIdukjAoNnLuGkkeNPiQgstMQGvfy5hTO9p1UD28lKkP+X
 hd02QSj/lwytrqOo2jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010066

Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
frames at up to 640x480 resolution over a single-lane MIPI CSI-2
interface and is controlled via an I2C-compatible SCCB bus.

This driver has been verified(include tpg) on the Purwa EVK.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v5:
- Use div_u64() for pixel rate calculation to avoid 64-bit division
helpers on 32-bit architectures. -- sashiko-bot, kernel test robot
- Link to v4: https://lore.kernel.org/r/20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com

Changes in v4:
- Rename the OG0VA1B and OG0VE1B test pattern menu entries to make them
more accurate. -- Vladimir
- Link to v3: https://lore.kernel.org/r/20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com

Changes in v3:
- Generalise the binding title and description for both sensors. -- Vladimir
- Keep the cached pre_isp read so the OG0VE1B test pattern still works,
select it via a per-sensor callback. -- Bryan, Vladimir
- Rename the "sensor" field to "data", drop bpp (derive from code) and
add og0ve1b_pixel_rate(). -- Vladimir
- Sort defines, rename the shared CHIP_ID reg to OG0V_ and order
og0va1b_data first. -- Vladimir
- Expose all four OG0VA1B test patterns instead of one.
- Link to v2: https://lore.kernel.org/r/20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com

Changes in v2:
- Integrate OG0VA1B into the existing og0ve1b driver and binding
instead. -- Vladimir
- Link to v1: https://lore.kernel.org/r/20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com

---
Wenmeng Liu (4):
      dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
      media: i2c: og0ve1b: Use monochrome-appropriate test pattern name
      media: i2c: og0ve1b: Introduce per-sensor data structure
      media: i2c: og0ve1b: Add support for OmniVision OG0VA1B

 .../bindings/media/i2c/ovti,og0ve1b.yaml           |  15 +-
 drivers/media/i2c/og0ve1b.c                        | 378 ++++++++++++++++++---
 2 files changed, 346 insertions(+), 47 deletions(-)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260618-og0va1b-55bbf3cabb0e

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

