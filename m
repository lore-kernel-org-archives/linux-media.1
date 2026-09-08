Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7355C49552B
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858450; cv=none; b=Z95kN2rihkR38cQvEDSUGQ1MBatW6Ufy4gUqnJ35WEp1EYaYC0kmgHjs41K0uFwpRLg9AUAdkYDj5br0tlgJ4s+/wxzMxzzZG02jbyRd86bmG0Yfyw3YM1PVvAvO17jBWaKFDU1ldx12pqS1+lUB/8Zfu3hBNBMl6tQqU+ZZ3SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858450; c=relaxed/simple;
	bh=i94jsUvZRq+8SO9oh0wqC2rJaLnjy9REx5JOEeL2P1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXBxLE4MSW3FKB6Cr0gS8Gvtb1ReLojhiXhVFXkPxvTzeie4BbMDqAYYo9Dvtm/4YlefP71bab2ylBosNzO4+nDKJcbdJhoGVzIXE7E/gMjSWmvd9q/VWV/r0reSHpiIMfzAayNEJN4fFiPj66ITBTPWSRBqnaOvbyeo8jOSDdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ATBcbSfr; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ATBcbSfr"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c169ae1cb26so880295266b.1
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 02:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788858446; x=1789463246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQ3TFbp27EDrida2ExbgWSsgk7vd6jvw28fnpdOrA3w=;
        b=ATBcbSfrmNhzh+EdsbpIj68KAS09QxAhT8p5YljSEmJR0Q4+9eQ1yMu9C/3kU7463B
         Z0awNT7iMvLCY95tjo0WAHVCsCENIotGrS4nrS4xayVirpLJnf3MkgK36VKvtjsOjVuA
         m2G67DWjS+e6g8DU8qELSZNj4I0Gl970cWLNl7H82xXn7HIVBGNIPRqr95fZdeO+aeWX
         leb/iQ7IHMvkd7OJ+SkvZa8f6eB4RQXxEDSqwwOD6bj8Zg3bH91rtVYuYPJf7kmBj9hU
         xUUEnuwc5AQH6T+9iwpHo9IekcHEfIcrVL/LTt32goZbW2mTvyjA73ymKzSujIbiCGOO
         agtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858446; x=1789463246;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQ3TFbp27EDrida2ExbgWSsgk7vd6jvw28fnpdOrA3w=;
        b=o3txTnKMsExAAsMic9d99dsfKOwjb5GgMbwKM7I2X64okoOQUKtWSypqlJS7Jrvorj
         /nnOwaX22MqG5Vpt+NXv4GROyE0fdH68FxgaQNOHDL0UZcRQTKf+mEIOhva0qHP2vA9w
         XS+ynIOeRerQNcEK/6TxGMQJjVDhKtB9jc9/q2LoGQYzG4WnMGYM3JNXz2LZHL60VLCZ
         bqkmG0peLF7b6f5WywlulxJf2FwKXFOl6XEHkXyl2xrLrOnsAEZSJCsgxp7O/4UWZkGE
         deSzyDkCSikuP4Oig651Eg/PWjaue+rO/m9L17EDoaIHZGTjkgI6v/C+2DAdwhPBY03H
         I/eA==
X-Forwarded-Encrypted: i=1; AKwUvBx1okJvjoGWiLMwQzxcpFTMYugnef/VG85wy0+oCPTWhqQv7ncQnrhLD4PFxS+tmqmDsKB8Cye3r5A6CQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lZwWxRqLnsla2P41PnhSjvbkJBJvKVkS3MiPuv6DyKCKejNmrv
	mo0PrrbXusLSDtVdgGAP+UAX6RAy+56xDWhDmO5Xcro0Jr6mrmaZ0/c2FpqTgZtYrR0=
X-Gm-Gg: AYBFou3+Ae8AERZ3tNzxvdckQdSgZhoXPhY/JNAhlT41L0I2moxZiAEvqF2YdMYs1r4
	2PuJvy/Tl4ZiQokoJU4+fpyg8aqAV8y6pzk1AwyhEy+sh1caS57OYH+GWBK8rvAc3IUz40PT8U5
	1sMd7G8NmXa0TM9h5ygGX+JWVBbq3EEBz7TTL+gqiGq+yoLqz7X/UBQrTEeSdKi+y1FRBfFKUnm
	LtdDhtDERTU4PQboPmlycVChGuw7P5olDT4cZPwaN2KbXQVOr5R9wxVd7aVwluyMDmFo4U6RgXL
	wSc+6/W3acDO5qYbu38QVCFfrp7uXzUQ0Dpnum8xgevSKdfGDnfFl4FS6MvWXui0rAHCNo4d+Xr
	67cCrjKPjwEmcHdaoxntuhp/PeFPdkvewrsBMY9Asr0gS73+frlRXYFDY42endByJU/J5JntBkB
	uFwTKBqNuvM5GQ2+bxEK626Y7DqLH8l3icXWo03kP6iVud1PZlpWNvxhTcmLkbFl4z6te6ilXb7
	g==
X-Received: by 2002:a17:906:c38b:b0:c26:1cfd:4244 with SMTP id a640c23a62f3a-c261cfd42d3mr604028766b.11.1788858445102;
        Tue, 08 Sep 2026 02:07:25 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.78.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5ace84sm575730766b.49.2026.09.08.02.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:07:24 -0700 (PDT)
Message-ID: <530717cd-ef89-412b-911c-15eda272b6e8@linaro.org>
Date: Tue, 8 Sep 2026 10:07:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: ov02c10: Implement get_selection
To: Felipe Calliari <calliarifelipe@gmail.com>, linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
 <yPgng9jw05U4c7lvF-XKmPIHOi7YeDi6CirTKGWG528IRm2_DrMA33QIGRuDDH4jY7eCx7IG7y9gQkolM_hfNA==@protonmail.internalid>
 <20260905030732.39196-2-calliarifelipe@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260905030732.39196-2-calliarifelipe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2026 04:07, Felipe Calliari wrote:
> The driver does not implement .get_selection, so userspace cannot query
> the sensor's native size or active crop rectangle. libcamera reports
> "Unable to get rectangle N on pad 0/0: Inappropriate ioctl for device"
> and "The sensor kernel driver needs to be fixed" (see
> Documentation/sensor_driver_requirements.rst).
> 
> Implement .get_selection returning the fixed geometry of the sensor:
> 
>   - V4L2_SEL_TGT_NATIVE_SIZE / V4L2_SEL_TGT_CROP_BOUNDS: the full
>     1928x1092 pixel array.
>   - V4L2_SEL_TGT_CROP / V4L2_SEL_TGT_CROP_DEFAULT: the 1920x1080 active
>     area, offset by (4, 6), matching the readout window programmed in
>     sensor_1928x1092_30fps_setting[] (registers 0x3800-0x3807).
> 
> The crop is fixed, so sd_state is not consulted.
> 
> Signed-off-by: Felipe Calliari<calliarifelipe@gmail.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
