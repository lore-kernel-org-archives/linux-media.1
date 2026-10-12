Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9A43A782D
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 21:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841736; cv=none; b=Sc1acxAmQGOdxmg2yGYkjhvV0eeGz6LewLd02MQy796Gm6y/R9UchIflXH63BApBcRNcZl2OePdc7kOAc0prwZ2rCwTajoRLczGrsqTMPp1g6rqQ+elTa1Y71mCoP2EWAR9M3rag9ethyXMyOL/aW0hnT8KTJ4Uoz7/6iljqunc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841736; c=relaxed/simple;
	bh=+LM//r49lcXL5ulzjzgjIm9/ZR3GBPhGYI9a3F9PvLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecj7PVZn3aXBNDNHCYs7RrD4sHteQe0lFPggwV57H/MqlNqlaOY3ncvVZKl3U/yklj4ych37hO28YU1e9eXZGGN3B0hqoV8bFKU9VXUA8nguplq1IZWuRY2QxpzNVio+8qoBeBP2k4HqZp2859bwt1P0pvot0z1/jmLrYNZJmNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPHTD69Q; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPHTD69Q"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e61ac64ec3so20141065ad.2
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 14:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841734; x=1792446534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzqsIiDe8Lj5/hNhbQ747+w6QQ1iGRWw+s7eZPb+FgI=;
        b=WPHTD69Q4BSSs8GKF56nQ28NGwtzMmd/jsMN/EEo2BkL+mXjWRO5XpDSu0u/bK7+xN
         N8CQ17XNUvtuM2ak7SG6AW0rJ7i2VqNmVNZ9GxDXB1JQERzjImWU0mkElVYTiPCFL7nJ
         jtzRTtwnN5OqzML+aeq7lRq4QuyKv8qcisJuyVFT9gM58js1ZO2UgfBDsm9rIYUZWemR
         IZgGJMDiKdEyWdCaRqeih5GCeNVtzzxPbKpKB32vm+90KjPm/VLx/kF22DFdsyjP2Bcy
         bTdQTRkE5Q0iG8VNsv7Zf8c0RI8DFmbipdQikEdPR4Imj82b9rT4Ao+jeXybS1l/POXl
         DQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841734; x=1792446534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OzqsIiDe8Lj5/hNhbQ747+w6QQ1iGRWw+s7eZPb+FgI=;
        b=j7CufIj40XAhJFS7bP2HIM+RlmmBaBJWtC6zXePpk9kgA3pvLTich5tyyQKwWRMYSE
         oyY3hCMbehVmUaOoo5TboaV1qrHxR4EdS53CSYF+zQIDL0OhW1i0cv6jfWuxZWjchvjw
         SBywKExIHmaxRhnyWArMWc0Jhu48MHVwcIfzCF/gg89F6uBwWx/7SHZ31Ph4ICScqCZu
         Afja+zra/7Fyftr3SVIjU9AJgtfzwMVt+s/S+fvHLUgsaVNGF65vpSg8h59iC2OwsG3e
         8Z3++YrlwN8jWQqexUIqqQ3D0noMvok4W4X8vu1XmJ6CZk9lwx+CQlI0smHEkzGECM52
         uPLA==
X-Forwarded-Encrypted: i=1; AKwUvBxkUStfMclWT0tbij+yU/jV4yFQS16nBoy6O1/+ZE6v6f1+LuMvFm0Z8u3E5tK36Hcz8XdebtjFo2a9Dw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIc2tHMLhdvy7yXSIC5q680mNnhr+VGK2ihJyQmFLSuk83Rn88T
	t5bA1u5gzTCC46zFzYEtiJPWLVArv21wDXhrAN8i71xI3BBfHktX56Jg
X-Gm-Gg: AYBFou3u+Y0aeE/19LimFcKjTABB59Qne3Tq4WxRI9LPJYd/NJUGqRWS9y1uPQrZTej
	AsfB8HnY60WADXbJIPAG4hTR5Da2AtedNLchNta/iy3fZvXAHRWAE+h4m5WRQnHeWri4L+qgvhv
	EOzio91kFeNSSoXqr3/Alve926td6rMWMwLD8ZNHqmY4twDgi+eBi4NvDeCAaFIpZn99IHEj8jq
	k6QLVCHApARtFtqlWi+uMea7s4yriT3+4VLx+QUOmaTCKaJZ5Z2Nyk7zMJBkV5UocX7Fh1d2WMF
	BId7qehhYaq+SgiNLYmSsDEwyR3vLQKeTbE11ruzGtAXfFFDvpv/grhOhQwxDq7KufQuRvcUcC6
	BzkScet+TZaT4Mi1Z6/m4vI+N8pv6dWwikPVq9Yq/WwuC6dkRrEdk2aMNe0NcEZ8YVUJcudAvi6
	EOC7r898A6K5m+Fn07c3aAA6MCsNH9Hl5WCvxuXeZpjEKwqiSbMPOD9Wb8jzL3W04KSOv/jzAnW
	eOf8tvnleus5OrHE1nKH4hJuYBG/VkuADYB/cm4DGkrVh4K2K/yFQT14YYYdw==
X-Received: by 2002:a17:902:ffd0:b0:2d9:4358:73ab with SMTP id d9443c01a7336-2e842aa662amr86633865ad.19.1791841734180;
        Mon, 12 Oct 2026 14:48:54 -0700 (PDT)
Received: from ryu.remote.fontis.id.au ([2403:5814:a404:0:cbc1:7a8e:f385:c576])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e1c89sm45467445ad.75.2026.10.12.14.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:48:53 -0700 (PDT)
From: Lloyd Hazlett <lloyd.hazlett@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Lloyd Hazlett <lloyd.hazlett@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/12] arm64: dts: qcom: x1e80100: Add CAMSS block definition
Date: Tue, 13 Oct 2026 08:48:33 +1100
Message-ID: <20261012214834.357754-1-lloyd.hazlett@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on an ASUS Zenbook A14 (UX3407RA, X1E80100), which this series does
not enable. Applied onto next-20261001 together with local nodes for this
machine's OV02C10 on CCI1's second I2C bus and CSIPHY4, written to the
pattern of patches 07 and 08.

The media graph links end to end, with every hop enabled:

  ov02c10 11-0036 -> msm_csiphy4 -> msm_csid0 -> msm_vfe0_rdi0 -> msm_vfe0_video0

carrying SGRBG10_1X10/1928x1092. libcamera captures continuously at 28-32
fps through the software ISP, and the frames are correctly exposed images
rather than blank ones: a captured 1920x1092 ABGR8888 frame samples to a
mean colour value of 118.8 with 99.8% non-zero and 203 of 256 levels
represented. No CAMSS or CSI-2 errors appear in the log.

Tested-by: Lloyd Hazlett <lloyd.hazlett@gmail.com>
