Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9603E4F475B
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841660; cv=none; b=uNKAFLiDCrycLzNy+RQ8KJZdJ9bAhzbW41Z7fuccr4Exey3z62yqSBqz4yNXjXRETEsRCZlu/P3fl6LoftltBp5x/ZKy5lzbqCPWRmGhkYifXpC4UfBlC/zTf5kuZ7KYQ4FsmlYr4UmMd0Et1aR4JczXurIH9gBbARdD4/hvjlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841660; c=relaxed/simple;
	bh=gBFBxLm8HkrP6Q8DthyOwtOjSWDTaFoDbTRkrYjC0pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csK3D+mpNCzko2cpbs12jf5cv/S6vXH9GG74/osm3WPeBlavSfexfXlVxeWCR4VqwUtjWeZo/ThDjYh9Bx66nCXPUqwY6dLut/kPNz2lnFVf4sgnxfbYmy2V37ox2x26HfL4cZPKMVnyh2UQhMH73WMhnIfEf8mb1U+1Q+znckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wp3fjWl+; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wp3fjWl+"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a7fecf8440so1115782a91.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 14:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841658; x=1792446458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQBJTSOmJET7mou+bxBw1N4I5xwZbM40VMBF+pO+89E=;
        b=Wp3fjWl+JaP9/5sMmj4HaTG4AWArX95YjxrxwjLkpb9imY30dUvc9ST+Eg0slPPuZG
         QBGzVEsA8TY663YMpP0M0JpM+wFR+y/TVbmh1p319HogyJtzLqyO17GU0RFjWGlYLlqk
         bONZOrDUZjIa8X3g9GDTWuwgI4t98o7Xx5VpPc+jELtck4u1OC/3ChWxdx6g2F0XMeyM
         S0eYCOnD4aJJr0iUmlfk93JF+DLs4Kep0EYdw8aqaKVyb6+rlw+VXNXnQFqgswmawzdJ
         wIjSz69B/v0J0LXNJUcanCOYDHf2zWZBPalbRubZBmxRVyzFj03oiNZkUyT7F1VgF45R
         GkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841658; x=1792446458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQBJTSOmJET7mou+bxBw1N4I5xwZbM40VMBF+pO+89E=;
        b=x0ZoyuIP1jS3d1nG2JphYfrZdPNld52fwp5mavYJhXuhlRPBP18/7I6JvBGm3poMrS
         ZY4urtQAN7T7D9NudKxu1HfTiJSY5ITvU0f3bBGAxkmHdYOJ3UVMZu7PbddUwKMa5hLQ
         oEtrzbci8aeRXWLo3x2hqxiB2c5uzU0l0TZXXO07f9qfApPsqbI4HZMrlYrJCRtn8JDj
         gnQputtw5xHwk3bWAY0q5w641eSOJJ3UgIQczh3A08RCZA1tJercB0uLI5+SKOCBCaxO
         5OCBCd1J+OhVhUEllstwBYc3aDQBUKMJHMwoHugaKdPlsLEBKxW2ZiBhj+3DZvS2SZbU
         Sq+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzGMtHQXhyBV4tnB5bV0N7mVeFF44o4c5+tT6+VFc9l6HDTZzpMxIIl1KNDUltCNx0yYg2VZLt/DWta0w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJuaJsxXxfyjFCvtpw0PMFR1PrP5GGn+S72QGHvYHLGbiNy0CNE
	QPdbK2xPvnwrYQMtL6CHo4OqF90t5qmYhx1mMV3f/kEeZtvc+vWCosgNZCXBZGNziCVVHA==
X-Gm-Gg: AYBFou0UmUzr0BOIYKOz5oNgKe8cWGwA0slVN69D3IxSd1sT5Z7/L+0ktq+YZfBZDua
	KzAOy5JdluctmRZ8It5U6tbU86gsNQPDQMQHicTRhlZdTZBHKlSQMy+2FsUluglUSkofIUbi80Z
	bL7u1euV1JBvHZmIqVMwttfslUuwK0VL9zlfX3sxhJZn5TgVjGYGfN9Zuc7BAVcbPWZD326bdbU
	cB000CRuCbZDgfSVhTgKhH8/OuEzos2jXoZZl+tavCPrypSmAEjV1RRheSEwitdTT19claZZAzp
	+o9n9sR9fomARtqg3lW+Vx7USMqW5GwKg3d59dN53RSfLf+nhzaCVX39vtYRZ+fqyMCx04wABPJ
	HfEe3ZFB6+qvgkzL9KZdTgXCCuuaZKkWmk94VugBRKmIJN5wxOrxcSInKjNJHIVGlANLgI5tow9
	Pft0vT6c9TqwaOGC97Vw6YY09iW3WPpYFc0N73DWEgLq4HULFQdH4qeaIJ3vW06Jgye/iLM46G2
	SzphZ7E+iPmuGFvS1iFOtAOQ3ihfvvjwbM3FRWOdQTU5+DK3ao2Qn3RG6iXvA==
X-Received: by 2002:a17:90b:3b84:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3ab3a4871e5mr8322337a91.7.1791841657487;
        Mon, 12 Oct 2026 14:47:37 -0700 (PDT)
Received: from ryu.remote.fontis.id.au ([2403:5814:a404:0:cbc1:7a8e:f385:c576])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3abdd5adaadsm7208435a91.0.2026.10.12.14.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:47:37 -0700 (PDT)
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
Subject: Re: [PATCH v7 03/12] arm64: dts: qcom: x1e80100: Add CCI definitions
Date: Tue, 13 Oct 2026 08:46:57 +1100
Message-ID: <20261012214658.357133-1-lloyd.hazlett@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-3-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-3-1a63eb35838b@linaro.org>
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

The sensor is reached over CCI1 rather than a GENI controller, so these
nodes are what make it addressable at all. It binds as ov02c10 11-0036 on
a Qualcomm-CCI adapter, and libcamera enumerates it by the path the node
gives it:

  /base/soc@0/cci@ac16000/i2c-bus@1/camera@36

Both directions of the bus work, not just discovery: the sensor's
auto-exposure writes take effect, with analogue_gain moving from 96 to 199
between captures as the scene changes.

Tested-by: Lloyd Hazlett <lloyd.hazlett@gmail.com>
