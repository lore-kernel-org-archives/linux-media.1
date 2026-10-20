Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478699;
	b=g5sdwSZaudZ57PYrBxrsSFDJc3S+epl2eiP3xld6cjqqxK0xQ/mGzqp14B5fFDa1a7Nq
	 2hUeZwsJ4ca+v8ZGkLraj2TcGwMhMzOT8NZ8VQ0wDwpRrbKqPI4JmWRmYAzZAsS0Ha2bA
	 eWK2lk/8VmoH9V1Cw59cYSTHYfhHR09LOTWqvlyDGuA6U0S3xp34Tgz5HQVQSRH178ecY
	 uxSE256SNuOkYB4IEqubuiXSQ9Friqh9YZVnCrMvL8mZUZhvULLlzrcS/ipUN6BIz8lxn
	 ucDmLWteCWwwtBkSvZNsX6wlEgDYCPhBv9m2fMUVmQDVOCzmqq/YEPVqLaapbJyoUGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cn4L3s18S9NAavDRPauTds7AtCfmozeJxP0dUPTZGcg=;
	b=b+AHOUU6qO6UlUXpFLcTFvqCYabk1D2WnXP9RD6W9XjEOwy5DSxJfc81xzRbLK6DmMn7
	 CTC+Pucscldc3oh9chRTa/jYXDIgd3EyEbKuFThj5VjWJ+U0Z/+q3nKGRD3sXvFx36tjZ
	 xOpmY65ORbaFfBuqB/u30ebACLA4ah8MBVCpYgeNQcQUxzyOEVMXSKdkZpeJENhEMm3R2
	 l66AiXfmCRF+ZzQ5o3AY8onw79RV5skfuoVc+BqQS+xF8UeRBC3lVc72dsyRh65XKMS1l
	 eljR44tG70XqoNUobsoXFltvPV8dr2yi8zXp4Fqmj040D5bwuBlLaRdLOx+8iBXV1tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lJOcG6rI;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0C2606A31C
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB0C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lJOcG6rI
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1e3b87ac5so16207155e9.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478697; x=1793083497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn4L3s18S9NAavDRPauTds7AtCfmozeJxP0dUPTZGcg=;
        b=lJOcG6rIfW84QMQcgQEh6NCqonY0PgoUVhn7Rwww0IjPzzS2tQNp4jnTsVEx4i1Cks
         +TEVwjTrsXoEeLVW8OOb1VMNigLC4k/ztw+MG6mUSK+9o1Z9YLTNnmBou1EJlccy5L4E
         Doa4zqS2lzi028EElhqpFAIkWQZWG4xDoAwmR9bM27lVb91pBcZJ3qB/LhnmmX93lUq1
         pP2WKoZq9swhspp+zCyFXhY7z6lLxUgO/m1NJCerppFN4DtnvS+aCavbUFAHfYbcZ30U
         9APArkDxlyUNTsdwjyBoE/EIpCRW8XxtDseUKBtaWfFM6OitlI1dM4y4UfLesX6xb9lJ
         ZOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478697; x=1793083497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cn4L3s18S9NAavDRPauTds7AtCfmozeJxP0dUPTZGcg=;
        b=mu1UuDicw3D1C+8YCLSCug16fzKxPJaT5vn2P8vF9StvH4lFhjMDMBX5XnQR6diP0d
         x8R0GYsPOI24sgD6tZYMbnXX4vaCetUhj9aPo+jyccBggvqA0Vgqp5kT5u448o/DpYxQ
         6iKLHwH6GYR6HD2jH33+khF9WuN1khUz821ffgsDBEdFx0Ei9xyv0a0QThJYP+OG7IqO
         oUNKZ3Rn4oPwm+r+4/dZB9vnOYpxlkCEEZivIyABjp5w3ydW6GmI1eJmyz5HQeUm5BKK
         QCG/a358zlshJtzCRbYF9XqhnaznqrM4byIe4dzJYbrMCNIkG8g3n3S/S+tYc422xfaO
         6adw==
X-Forwarded-Encrypted: i=1; AKwUvBwI4kmRVLhF2CfmB2fnR9gj1ndSAGXE7GiBcVh2zB2l9rctPr4+ktCIQDBC6CjcgkiAndY0h3kj21QP8w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIU0UkdihaeB4Iao0i9yHL9lMWks40WIJcpE3a9cIEgE+M+ZgOL
	342V1+CGtNQ4Y9DS3d6/S+qRW+oN+/Pvzj1KyVFN2QcNH/KuolZ550Z0
X-Gm-Gg: AYBFou2uxyk5TWeBkPKHMVEMx2pzPgZ1Mv5QjK9IJmO1yrattHuxDPyyXTA0574hjz4
	CZ8WH7veqjXwnApPItHF5hs+mlre/RLNpj/2ZkNhCFSqZUhFG7t7CSg74Vtd4peCZUy35u9AGNS
	1EidWXzt1j447W+KHoZ8i+rN9AJt52pTrkEndm9smVAyhl6RZ2GlI4YeUXzH3+fgmGWl7TJKGMw
	3hxi5uL5g9IUkUAOfnkKo5p+8PTLkbEYuGwlfs0eziXKw4HXs0Gqreg8OmDSgo/v98Hg4+HZMJx
	/4Y6M5cVElLVkz55fuyOaP0Sy8H6E5jV/ux54J4fdAXiHYT5870LFdFItnj3Wn7cHOh10mRhVbu
	kniZ4t/Q4Lau2/2Zpbhd/kVcsowWWU75EGsNOz4aZqN9zWybc7zNnfSc5PjXAaAnGYbBNkSuOhW
	Ixjjc0mq/j2v8lhShVKOzuaQ7rUsv8BsciHgDeDbBzDtyEoqYpl0SjVIGdkXueGMFAyQ9DY+pNt
	9xOkmXZWKRtgdKY29M8az37VtLgufZfHHbcpRO/sCz+TlE1O53w6lfDvrZ1yi/abBezYk7M904=
X-Received: by 2002:a05:600c:6815:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a1d762367fmr211999865e9.34.1792478696868;
        Mon, 19 Oct 2026 23:44:56 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm223467045e9.4.2026.10.19.23.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:44:55 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Date: Tue, 20 Oct 2026 07:44:54 +0100
Message-ID: <179247822513.25202.7960395606350309657@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019193402.52923-1-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-3-lsa.uz@pm.me> <179243379000.31842.4735750009847702427@gmail.com> <20261019193402.52923-1-lsa.uz@pm.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 19, 2026 at 07:34:10PM +0000, Sergey Lebedev wrote:
> From 19.2 MHz, 403.2 MHz (806.4 Mbps, 42 times the clock) and
> 384 MHz (768 Mbps, 40 times) are exact, so the change is one value in
> your board's DT, in the sensor endpoint:
>
> 	link-frequencies = /bits/ 64 <403200000>;
>
> If it still stops after one frame, I would be glad to compare what the
> two drivers write at stream start.

That took the clock mismatch out of the experiment. With 403.2 MHz in
the DT and your v1 otherwise as posted, the sensor probes cleanly and
reports link_frequency=403200000 and pixel_rate=134400000, but capture
still delivers exactly one 644x604 Y10 frame and then times out waiting
for frame 2.

I then went back to the earlier VD55G0 A/B tests on this same Snapdragon
machine. One result was particularly useful: the 1200-pixel line length
alone still stalled, and omitting the 0x0329 write with the old line
length still stalled, but 1200 plus leaving 0x0329 untouched streamed
continuously. Your driver already has the 1200-pixel line length, but it
also has:

	vd55g0_write(sensor, VD55G0_REG_ISL_ENABLE, 0, &ret);

I rebuilt v1 with only that single write omitted, keeping the 403.2 MHz
DT setting and everything else unchanged. That fixes continuous capture
here:

- 5/5 frames in the initial Y10 644x604 capture
- 120/120 frames in a continuous run at about 60.2 fps
- immediate stream restart: 10/10 frames
- v4l2-compliance on the sensor subdev: 46/46, 0 failures, 0 warnings

There were no new CAMSS/CSID/VFE errors during the runs.

So the link-frequency correction is needed, but the one-frame stall is a
separate issue caused here by clearing VD55G0_REG_ISL_ENABLE (0x0329).
I have not tried to infer yet why clearing it prevents subsequent frames
on this sensor, but the A/B is repeatable and agrees with the older
VD55G0 results on this machine.

Would you be comfortable dropping that write in the next revision? I can
retest the revision on the Snapdragon model and add a Tested-by once it
is clean.

Best regards,
George
