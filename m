Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DDD38B12F;
	Mon, 20 Jul 2026 23:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784589782; cv=none; b=V3xGWrzp0k5C9sXP5gTJ23JMNIPiJNqYTmIov3DsBtUDL7QipEHK5UDKgj03I3PWPtgCnljsZcs/tIEpyumqiDurqSNDbKun3d1nzwQ5F1rwguwFVg8M7F0MnUTSfrsvVFKWOyjYVk9jH+YXKT2M5m1dT301Xnj0L3zegrXdg/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784589782; c=relaxed/simple;
	bh=ZwsJ+a1z2kzPPQqfoK9Bddh7Ebq/84anI7Hmi1yoxV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkFzE4fX+cHi6b97Zg+mOkXvDxskfqVbjwOD+dkK0mtyjzlX+LyezAjf8NJENOgiZBXOYwMmn5mub0ElGVT1iGOeQCEApYJVCwtI1Pott5cG/rk4bmKF+dHFhOgH4DAmYyJwESjQlAiNmAX0ksTmr+uulFCQ4nEUqAet4H5g2oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3SPSXQu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3SPSXQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC5E1F000E9;
	Mon, 20 Jul 2026 23:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784589781;
	bh=jd68xGvThXaXv6O3KZy/PcCC6RBRGQwYCWMnX1oPMb0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=R3SPSXQuvEp0F3esSt70BNc4SzYnEr2eeFEq8+3ebkp6c/trN6Ff+shKUo20fU9O7
	 K5h2f+ONlWM0gDgD+jpLQ6wGJYqOYBri7h76oOVu0uRBeOW1PDpogPf1xOlM4z35tJ
	 fvHjNiX1halsRj125xeyLEp3aUjCGDGUx7XYgW40Wl7UChnrG72fdUFuyuKDS60j62
	 V3SJ9ptEWcI4cnIzR7msEf1D4UqCR0m1tZjD93qaC/Y8vXCvkrcPPJ5qyKlSYk+Pg5
	 h52MJBirpjy21V9uEHkavmsteopuQitqt6pmHrlixnUpu/qwr/oG3YlauMHPffN7tZ
	 kVD/fGXaAx1nw==
Message-ID: <db859606-22e0-4556-82d9-21c6a21b376e@kernel.org>
Date: Tue, 21 Jul 2026 00:22:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_venus=3A_encoder_job_execution_hard-resets_SoC_on_S?=
 =?UTF-8?Q?M7325_=28sc7280-compatible=29_=E2=80=94_extensive_analysis=2C_nee?=
 =?UTF-8?Q?d_wrapper/GDSC_insight?=
To: Kirill Ermolitskiy <00vopoj00@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, vikash.garodia@oss.qualcomm.com,
 dikshita.agarwal@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
References: <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com>
 <035192d8-9d6e-4e04-ad1b-56f52c11933d@kernel.org>
 <b6rUao5eYcEHwZ_P1JyyUjJUtwY-yJnWVfxHUa9sHdWOmlMoXSLxjMoscSmOu0V5VkwrO7q4TnNzRvoFP5RpLg==@protonmail.internalid>
 <CADRRrN23tWrKKnPDdsO_61QQd790z2W+2ejZ-s1iZkJh+=oHhw@mail.gmail.com>
 <f4041aba-ccbb-4126-a65b-a385e882949e@kernel.org>
 <36vhfeWCV4PqtDGfEur9lR9MVGp1d_CMjIb_Wr9zTFbeNM9QPzCJsn1TzyTYnZfbku-iwBZo-eDdLasYJ5hE5Q==@protonmail.internalid>
 <CADRRrN35SjSPqYH+kUowf3RCcKgnGqVQAKTd73vqMLgdz1q5AQ@mail.gmail.com>
 <1bc74fac-859b-46fd-91ef-16c40c8f9a7f@kernel.org>
 <CADRRrN36-iWMdOBxDHKjV_SCs2U7jH6YwJO4ycTe5_w-2QTTyw@mail.gmail.com>
 <CADRRrN25w3Tgnnoi7FD3U69gVyf9COO_m+k9rdX9GOcb6asm6g@mail.gmail.com>
 <zfcbexld5clt6rrvlhfgtjztxus26vwsbceslye4gsb2gopdvz@f67onnyhpskr>
 <KfMRWO9F2LRou7cILG4EpEiPGm6HffchpxVwhuytmRA7a1-nRz5t_ju9AHD9c7X154S9pZIcxpacRlyoQ3RYcQ==@protonmail.internalid>
 <CADRRrN164E5vszWvV4Yfrwcmw=+miVYzikgWXY6gkrtqCeb8Sg@mail.gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 xsFNBGRJNSgBEADD7Vm2ZFa+v+JGJ2QYTJqQAkqis/uOHkhdFNXqpBarVBd47QU/DMNU5Rxg
 jedMQEmHoeDbJ6UOpjbrUQ63c5sgG1JbroHJJctwsEI75OOlekMuebEbjIJBLfgENGwPBMHv
 piv5TgCWr0VgYaXfp2eh2LINFywzqj823HiDPibQAXDrjzvF1ogksi/6cQZs8d4if8YQkLOr
 YISFouG+eR0nN1I7mUfIddXOWu6lJeTyqbWVurv58k2ekIXKaOC9ixLHFbcfYV0hOgRaTwQC
 B8CYF9nfqZla19iItfsN9QxN+ZdQjcRoYipp6HPCMfJlKH7GfaFcW93LKc4DKJ2lVL+pg/OQ
 lythZbjRPY492NG9kZ65aYstCs90uhMUEVVPuGUw7wBEku+6IEwZfrbMVKeWzLlPyM4Hv9hM
 8ktxSmxWsPTPqpBC8eyeAQLalMELAyVcZlkaCtEcbj7w4l/JkYz+4l37obG8ZD+B34udBUUz
 MsAJ8foDFrBh2MOFA3hxD6G90D23mmWsri7pnKA2tZs92aQX7Ee+FbCyg6g5ln62Sq83ZDbf
 53DdBs55EVpBadeInWmXhzCHPQx06H+CwTEjShTYIaMmBfrewvYUDKvFTC5iKQhAEUgt6i94
 JsbG7NoeqcxkUMcBOEUQ3uCQG1D70ugspgXc0wd3Rimiq6535wARAQABzSFCcnlhbiBPJ0Rv
 bm9naHVlIDxib2RAa2VybmVsLm9yZz7CwZEEEwEIADsWIQTmk/sqq6Nt4Rerb7QicTuzoY3I
 OgUCZ+R+mwIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRAicTuzoY3IOimUD/94
 BwVEJX31JRe2sxbB/e1w2p8x1bxvTw5AeIzpV3ox7coJg1bSU2mnGuj1V4o0Yxf/3zmcJzCN
 VfVjwRF8Ii3GnC7uUXk2t+87piQfKTyJAYQABhZUKgoVJbjJq/S+C3XCKIyBA+EiezoUsgsA
 jTzwU+FzV7zVWIXFPJNtBERLwboE9w9U3KjAExOa1kSY8eLrsg6kOwlOHWy5UsQqYOjrS96M
 mzm2xuc1+RCjrndAyYhCnrOKvJ67HsPnBeJCjw7ImGD/U1GchwYbX8o3DO3JNHm3qfC86ZqX
 2sCouENg4OzgPTtLKUrueM6xsu6KMM7gj17vxsiR3KQEoJnnMB8D1xtBofN3mFZE0wD9M24m
 8yGunZbtntMCUHzIrlJgAPwKWKuGOYtA8UgMTFkccnUJtQrg9KotKtEF/FuftG9zLG9XEkt4
 5ZdNgbSoLWgelu3T47mbOJ8LHhiLaCWP7yrovtVAvLUQ1BsiA42u8ECrFCFvQj9nrejE/ICv
 kP+uqcKtdDvP9HrIGycF1WZyfZLp0RvopKW92FLvI4I1QFWJ+wenk6+LGyJ5bzlrWzevjxmf
 nHcXE6sJBHrE7eijlbbImDAi3uLYN8Nd9Dm11IDAy4GAIQxSiQn0yblDhPiyGtchy80EVkCm
 g9k17Wol+2E2mC4DKgVdCkyUtTRSLgsJCs7BTQRkSTUoARAAuTnmWHBS6izRcEE93ajpzI7h
 dgQO4U3IRvOEsvIKR5NGcNEs0ngGebwsZ/lVULjN4vYU0LleqVhPBidNXUoZCN3A0F0Z2Ov8
 NZdef+2EhQPBVWxFO7JBzhe8Z3ALj+wFtlg8akJjBzU56azW/iJzAobqHVrudzKoO2b1/CMg
 VbiAQ+RXjgfN5kY/HqYDU7mw+hXuUV9PbtX1L8xqQQac95oM9rHzKHHpiVwxTeJnGQsa+THi
 Kze+YET3rCoGHMvOQEJhdrucTv5FpAakKdkOFNel9FFckLRKEuWgCzhpFsjQ7xbirQgFUxG9
 vlk1+q4hMRGNyEqoD6svYEeqbiUSd0oPUJeioiC3rNMRCNHLVrfZ2J6SCPkxfda08uzSdDQU
 1/YPjOh8ZtQDMu7WctZ3XO288Z1gyBR49V7fbFs2w4sQxG+h/enlxqP7fdw1mjUlZjU5huCJ
 ielS0oEaIpmUpkugli7x4WhwLnhK2EbSoz7nLBC0y+ALUOdMlz/Y1l9xRt+bkDhpmf4O4IcI
 MxgZ0QMLq8rHDkGaEbsgZZHQPS58T0XE3IP30Q9SNxsruCMXtd2hYtBssf/wohc6JVsTtMg2
 VYTPDPIFNZFSXupEJB7jlqpDWJ8ooJfJRLBatbjT5+mVQaMYB7Hs/t+zWYWaJKHyc8O6WLEC
 NUV5Tdt5EkkAEQEAAcLBdgQYAQoAIBYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJkSTUoAhsM
 AAoJECJxO7Ohjcg6LuIQALnXt36OUuK43wqw6UYt0cnN6EbUqJHApAF5eNFn0jCCB2XELjSz
 JKJwuNAweowBdabiBniJ+501WIW+ewEsz1uby5fUQjZuCEsIkuaIluyfUFPb73qrQyAGuusd
 7teA4WT+/jUku9g7lX5sVoRCrKQPkd16f6Bzfztyqyjcn43/X5yQI+wlboQ6HuKe/3I3yiOx
 OgmCHzOawpC9PvhEcKj79RLM3Zz5Ts5AuHpRX70Jz8Be76LwVFLp5Msx3S24ZTU1lBo2uiJ3
 xSkay2lTpyVWRPx9vgcwzxGguOPJQJwsQeLb7wpoJMPpD3ERoaRii7Q7hvmxklpZjhKYWB3d
 t6nQ497Ek9loCrp3MIjRCSDN5xEGffiHks9yTeGMUQwO4tX8RE04uOJPkUY7uCFzFqN6/qey
 X3oFfPgkULMdiHofPAL1OskZSTzGPSfTYRE46NCJw8yoZBQ/oOyWeqaUQbK0wmW/g81wm8p7
 LKSGEglMpiX07M1AotgvylN5C8fjbouoK+/RAMsXkk8jba6rPfuuXPaDjCyyKn6zSVHETnHW
 3AJbgVY50T8STpnxayBQvWbCvu+6NOEjXCbyaOJig+5l0zlGN9XHjdANXC5HnwmyaGRL9YDq
 Jh2nVXVJDincOdQRdKcJjYLqaOAoWrYWSDi1iZGspHBTDrnOvfMQzzHY
In-Reply-To: <CADRRrN164E5vszWvV4Yfrwcmw=+miVYzikgWXY6gkrtqCeb8Sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/07/2026 00:03, Kirill Ermolitskiy wrote:
> non_secure_cb: iommus = <&apps_smmu 0x2180 0x0020>;
> secure_bitstream_cb: iommus = <&apps_smmu 0x2181 0x0004>; (secure)
> secure_pixel_cb: iommus = <&apps_smmu 0x2183 0x0000>; (secure)
> secure_non_pixel_cb: iommus = <&apps_smmu 0x2184 0x0020>; (secure)
> 
> Mainline programs only the non-secure one (0x2180/0x20, which matches
> what's in kodiak.dtsi). The three secure banks are TZ-managed downstream
> and mainline never asks TZ to set them up — there's simply no call for
> it. If the encode engine emits transactions on those secure SIDs
> regardless of session type (in line with the SID-selection-by-IOVA-window
> behavior Vikash described for iris), an unconfigured secure SID on this
> vendor TZ would explain the silent PSHOLD precisely — and why decode,
> which stays on the non-secure SID, works fine.

As I understand the defintion of the IOVA bug, when the IOVA is below a 
600MB threshold the unexpected SID is generated by the firmware.

It sounds like 600MB isn't the right address fulcrum on this platform.

---
bod
