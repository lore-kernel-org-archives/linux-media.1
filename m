Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDC54F6464
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565390; cv=none; b=kcZrDTuNKz5vxEa3xGr765ZOF3mL/r2HUPwtx2uGRdJl85txDUKK0SKxuiLEl2zyz2ImzXejLyhsCep6q6V1DZAYJrvd/xDEkUtS/WLgiD5tM3pv1IlNMG9O1gSsfRAR6VFCjABcSxu/7afVbmcMKD1tHITudSE5WAJuR7qkgh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565390; c=relaxed/simple;
	bh=pB0+L5OLcmL52KZ7MnLhTwXXE7rnrcFAPfaF8iIliJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dHJbL8w87Oh1Lm3JgcF4Ma41veH8p1u9WoFoeTDl1j1Y0OTknRdXKcev1VSMrO+Bb1yMqRk1HaOCDNw8s0v3KTqVjhUV0Zn4WwW1dPT+IdUSum4w7/S9Xmxg6lG78RufrFtHdRzDXb5sfM2li3+yZUcf7yEocxg5R3z2cGgqvBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOYEzCBO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOYEzCBO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so10393055e9.0
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789565383; x=1790170183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUUWWKVmm3TYP5508zsFDBoNmLN2rO04Kb+yJop+U20=;
        b=pOYEzCBORbyCAW/s2EBBA5pbH+5U1HHxTzSbzrAy8aWjU6gEXH6U1t2MIwdKBHN1Vv
         YJ2dUCSypttpbFbcNjVo4OHPH/5wIfxH02K86N5v34LCma/Z86/unOYoyZ7OP5zRijAU
         DflsZicpob2D34cHC50hCEtFpMgZonZWzQpdOTBPR8dHuFn516KVFZ3NlSNZsCrmdEb6
         cqF+hAcwbtDKEZtt/9UWUh6ESBlRHtiDNvuLYvfWPqgJPi3uEuSatM5dv12lmncwN1yX
         8lcS4eVd8ezclT49xaPkNZb/zTnWfXi69s2ysFg1AqrOVrAHAnZLL+KxI0oGDb/Lyy1G
         YKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565383; x=1790170183;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUUWWKVmm3TYP5508zsFDBoNmLN2rO04Kb+yJop+U20=;
        b=cmHBTsv8WeNHyyQPoY6mrG35GHGAwjn/jisYZPbO4NS05np3v6Z4DIeXreL6dA0fNB
         EqVL1vXFnozlwSqoe+NnTeoPWqKVSuEZ4h6EGrle06wiHonMgncqmIzz8jC0YZReD5iZ
         BRbKafpMRLmfvN5EZYmllGsqu/I9zBovjg8+Y1rC7Xkvkv+273cOViYGSr5ZTTr24q9D
         gQyusKq6xIwwVYvpsHimFSLmxz/I2BRwldLc2stH6/TOoY/ZnubruVQ6+j3o1sOTxXcc
         i7pxcQtyPFpyY5dPXeVDpO8I3xzTC8dojJLkIyff62oPkNUzUwQn5YYEr5Aw7ROP/WzD
         aF/g==
X-Forwarded-Encrypted: i=1; AKwUvByyTpuEl8kiUV4jCNmBYceF6zRiYfwFanSB5GuR4fhgppqZOBctlsoGA+peUSu1EvbZjT8rtKDxbr4V7g==@vger.kernel.org
X-Gm-Message-State: AFuF++kkh0IVN1KSL5X2xefCtX8Fmkll7bu1HpRmX2/0OWJKkVExSBHU
	BYmK2Tb9a1J/ENDnPDEgcwc1mvuuhy6KEeGAPnlvQDxom/OZSU2OJZOb
X-Gm-Gg: AYBFou1qtGU4GxAt134z1jrkgH3UBlo79K3Zqf1oLwQI6a73SQiDW/msw3n9VOyHWPd
	dPmTTIIY6C+Zo5qnU7WNYrNzdGef5NEb0UuW/KBo2wfuNXQgXURAoWiB3hNhcTKCXG/npZVTvUF
	BuLYiu+fHbZ9EEYezQAYroQ1J99SQhhDUOmRePYGuUBOoAE95Oe9o8F2NdhgIPtd4Hw1OtQHZqP
	eLtEQdKOHroIAwVG9bOQlv5u/H5DuLpVBCWCiQfXJfx1Q9ZNFkYhB8w4iV79Sfb2r/rPNkxdhKH
	Kwle7L23qPfUeDCi7J3n+wX6JOGVOaamWaL+iF53/Gg5cVVVUm09iXkofpkMwMZ+yEN7uGWeLe2
	HI75qt5UqYEpBPsg81ZP0IxLPPjgQzmWFKouxHve72NRm2h7BFgqT/151VN5rDRStEnZe9OJwiM
	6ZtgFDDYr69tvJOgEwjV5Uv6w7uBHc6gZoshYKyJYu2xmwDtUNcElgwIaFaaHxdVLLKC1SEX6i+
	3gsyN8zHvw=
X-Received: by 2002:a05:600c:3ba4:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49eb7337325mr40903525e9.23.1789565382845;
        Wed, 16 Sep 2026 06:29:42 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bf1f80bsm6884173f8f.7.2026.09.16.06.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:29:42 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API devices
Date: Wed, 16 Sep 2026 15:29:33 +0200
Message-ID: <178956537382.2699.6279926603215472320@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bryan,

On Tue, Jul 28, 2026 at 10:35:34AM +0100, Bryan O'Donoghue wrote:
> Add support for PHY API devices

One thing I ran into while bringing this up on a Lenovo Yoga Slim 7x
Gen 11 (Glymur, ov08x40 on CSIPHY4, two lanes), with Nihal's Glymur
CAMSS series on top: the two ends of the CAMSS <-> PHY link count lanes
differently, and the CAMSS side silently ends up on the wrong lanes.

The csi2-phy binding numbers data-lanes from 1, and the PHY driver
converts:

	/* Convert data-lanes = <1 2 3 4> to bit positions */
	csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i] - 1;

The CAMSS endpoint still takes its data-lanes as 0-based positions;
camss_parse_endpoint_node() stores them verbatim and
csid_get_lane_assign() packs them straight into CSID_CSI2_RX_CFG0's
DLn_INPUT_SEL fields.

With the reference boards' style on both endpoints, i.e.

	&camss_csiphy4_inep { data-lanes = <1 2>; };
	&csiphy4_in_ep      { data-lanes = <1 2>; ... };

the PHY enables physical lanes 0 and 2 as before, but the CSID is told
DL0 <- 1, DL1 <- 2. Everything probes, the pipeline configures, VFE never
sees a frame and nothing is logged. With <0 1> on the CAMSS endpoint
alone, frames flow.

The x1e80100-crd and glymur-crd sensor patches use <1 2 3 4> on the
CAMSS endpoint; with four lanes that yields a lane assign of 0x4321
rather than 0x3210, so either the CSID tolerates it in the all-lanes
case or those boards only work by accident. Two lanes are not
tolerated.

Would it make sense to make the CAMSS endpoint follow the PHY
convention when its remote is a PHY, so the same numbers can be written
on both ends? Something like this on top of 3/5, against the parse
function:

	if (!legacy) {
		if (mipi_csi2->data_lanes[i] < 1)
			return -EINVAL;
		lncfg->data[i].pos = mipi_csi2->data_lanes[i] - 1;
	} else {
		lncfg->data[i].pos = mipi_csi2->data_lanes[i];
	}

where "legacy" is what camss_detect_legacy_phy() already computes, and
the binding example for the PHY-attached case says so. The alternative
is to document that the CAMSS endpoint stays 0-based and fix the two
board files, but having <1 2 3 4> mean two different things on the two
ends of one link seems worse.

Happy to send either as a patch if you prefer; this is your series, so I
did not want to do that uninvited.

Thanks,
Oleg
