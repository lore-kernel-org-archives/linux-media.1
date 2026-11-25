Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607535;
	b=xaYZ4nmF+YchKohsk/JcSu13jqK5Ur64mzalCUB1MK0nMLwK0ZkVZCWHvqJToHrqtlQ1
	 KoqY4fbVtxMOK+eG3n+8XYsJAEIwc3dAyGY9kczXvPTqrrMNiZfSMk2q067KUfp5vlbT8
	 dKQW8S1CxnoJmyixCa36UMlZeRgphHVwnhXvLYkupbrSLbYGYD3P2aWBYydJrWQ3Fytvz
	 uau/k8y2sMhYTMaJdLQyJaBDAaCiyZOHC+lFKZhvNvgCUzEws8MHd1nPQcZ1M5kxotafK
	 bnFZVn7EN3411ao1ENmFa0dGsSyOWV1fRyD1MCWbt42RaoB//C1RCxtRt3uMcNEXIpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607535;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zdbZ0y90ffhDUpo4lRLPwkdF0/IM99iMJ9dvdP488pE=;
	b=r8Dv42/AMylfnfMxNChTV+w3UhrWYsU49b3WtVFcL6GxHGGk1iYOIX3+wq3ZV6+VASQH
	 8YmFKJD5Ak22SQW2LjylkTdiiSCbtosuR8vBLgp0fWMhpfNtcP/f5MTYEZ6HEJWXthUt+
	 006U3WUrTonwDmBglk7NImaSxJdhrfpdqmt/De9g7d8hLFU8zdZ6gxWqNDIUcrAHY13WQ
	 jOkSVYy08+9jHY4MxR3rCGzL+WLtjiwtuUP2+4XXPmm6eurbENLYXcHrkUM6mHiuKVs2i
	 WXkNPy0jn61iJZvythDXM8f4ltYLpuzc9AMHKWC4KTkDDcVWYM/5UW/vSkkVMMKrs1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BxK4qg48;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E140F606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E140F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BxK4qg48
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61586339;
	Wed, 25 Nov 2026 03:52:11 -0800 (PST)
Received: from [10.2.201.43] (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E480A3F86F;
	Wed, 25 Nov 2026 03:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795607534; bh=MUXFKchOwPGZlz2/dR46ovDc379Oy8m4rWd0gZWHiTs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BxK4qg48s4tlKVteQFoD3ZehEqTx9a2OtDMVSrpkXI/gz9Q6DxGP8rebvKfL8mHMO
	 PB8JFqLuikbAJeIAUMQSlHtIvMvNHiYSC09tQ3RJc1PGCfVhtLScXx0b4oBwQ6n1rG
	 CNxycpL54QFcEqvDbEmKO0NWxHSy3KSQmO1kFqCM=
Message-ID: <373bd41c-2f98-4050-9fa6-725ad2a0eb14@arm.com>
Date: Wed, 25 Nov 2026 11:52:12 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC,00/28] media: add arm Mali-V76 video decoder driver
To: linux-media@vger.kernel.org
Cc: Linux Media CI <media-ci@linuxtv.org>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <6aff2650.7439f5ce.3bfe4b.cd09@mx.google.com>
Content-Language: en-US
From: Charvi Mehta <charvi.mehta@arm.com>
In-Reply-To: <6aff2650.7439f5ce.3bfe4b.cd09@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/19/26 16:39, Patchwork Integration wrote:
> # Test virtme64:test-virtme
> Error running test. Final Summary not found
The virtme64 log shows vim2m passing all 68 compliance tests, including
streaming tests. The kernel then panics in `kobject_delayed_cleanup` after
unloading vim2m, before test-media can produce its final summary. This
appears unrelated to mali-vpu. Not sure if this is a known issue.


> # Test build-basic:x86
> In file included from ./include/linux/device.h:15,
>                   from drivers/media/platform/arm/mali-vpu/mali-vpu-device.h:9,
>                   from drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c:9:
> drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c: In function ‘mali_vpu_fw_parse_header’:
> drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c:111:25: warning: format ‘%zu’ expects argument of type ‘size_t’, but argument 4 has type ‘long unsigned int’ [-Wformat=]
>    111 |                         "invalid firmware BSS bitmap size: %u (max %zu)\n",
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/dev_printk.h:110:30: note: in definition of macro ‘dev_printk_index_wrap’
>    110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>        |                              ^~~
> ./include/linux/dev_printk.h:154:56: note: in expansion of macro ‘dev_fmt’
>    154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
>        |                                                        ^~~~~~~
> drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c:110:17: note: in expansion of macro ‘dev_err’
>    110 |                 dev_err(vpu_fw_bin->cache->dev,
>        |                 ^~~~~~~
> drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c:111:70: note: format string is defined here
>    111 |                         "invalid firmware BSS bitmap size: %u (max %zu)\n",
>        |                                                                    ~~^
>        |                                                                      |
>        |                                                                      unsigned int
>        |                                                                    %lu
> drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c:111:25: warning: format ‘%zu’ expects argument of type ‘size_t’, but argument 4 has type ‘long unsigned int’ [-Wformat=]
This is a valid warning caused by the 32UL multiplier. I'll fix it in v2.

> # Test cocci:test-coccinelle
> ./platform/arm/mali-vpu/mali-vpu-session.c:1159:0-1: preceding lock on line 1084
This looks like a false positive. In `mali_vpu_session_fw_bin_ready()`,
both the lock and unlock are conditional on !same_thread. A synchronous
callback runs with the caller's lock already held; an asynchronous
callback acquires and releases it itself, including on error paths.

> ./platform/arm/mali-vpu/mali-vpu-session.c:671:3-9: preceding lock on line 668
Appears to be false positive as well. `mali_vpu_session_wait_pending()`
requires `sess->vq_lock` to be held on entry and returns with it held.
It temporarily releases the lock while waiting, then reacquires it before
checking `sess->error` and returning. The reported return therefore 
preserves
the caller's lock ownership.

> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/116657798/artifacts/report.htm .
Regards,
Charvi
