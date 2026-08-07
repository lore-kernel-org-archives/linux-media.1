Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE714364058
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 08:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092405; cv=none; b=eZ1kRIJHEwefall2CsyXN6nAl7jxu6Fh9HRGXsUQaL7eNynccs5gXzyAoBNpSRHGBAb9LLSwsuuYrCXNJDrlVaXJysqwHw3dgx6k1bDu8iyJGGExjhCU/DbuMDYTSFrLI/Pc62aB7COiKa2zQqGx/FGq5K+gRH2sT/Noe1eObco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092405; c=relaxed/simple;
	bh=YwNlK7A55qB8396L/ayxXzR2FuOJIAlbmtaKLe06wEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dtCR++X5nP0UtoRzCblYzZf+DyvLOLs2E1ZD+CfTB/PTRc+0XXorKhvTKZ+QpO2TnPzSgPyYPrH50VMgRKwUbRAVIqE2MHal12JtO7FGA7OAHPhXgRNlPZHzZW0KmBUJ+U4lWFvJU6tKFhlMtzb+yksXqn46xPS1IiRwtnevt0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTqQQnqs; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTqQQnqs"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47de0093c42so2303951f8f.3
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 01:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786092402; x=1786697202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUSIPfG/BB3jKwKy9WpPCVr/+aiChLfo3itvMt00IKg=;
        b=iTqQQnqssJBaQhrmuBNttvYiA4M7bhMTfEOsYQ7juTuyPADDg/9Z3w1sca+gafFPzw
         d4Q7pc9FKVOLjo48gRxQZ6Ix4XZ1hYXy/tyecrWnDj6d7dgzSi9YpnWj78Va1rIeG3B6
         gDQKsUc0Xn4+JGmlu1lGqNs41wE1QzLYamCyE1GXtmQSGYhsK78YNudmKeEBBl1NjuLI
         GrzmOWpC75tXFivUFzaZblMDgEdQKg553ABfI8/j6es8YP/X0Tbb6AONRPQKyvg9i7iX
         qfvzCO9vMmNB5+eb9cN1xqjjJW8W2CDhHGQXuLQih8FL6sgYskFrxtuwS+ZXP3bC4ec6
         qx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786092402; x=1786697202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUSIPfG/BB3jKwKy9WpPCVr/+aiChLfo3itvMt00IKg=;
        b=FHq6ytz6f9Ix2ni0qqmvw8aaxZn8BLh8HDNGcSWFWwBuQgDlCdfqxGwnJ3aEGr5JEj
         0dj/y5NC1V2BymjGCb+JC0F+24zoYpFvPTnOEwUYydC3Stcs6xmfpR+5PS/JBqJqf1Dv
         d2a2qpIZptVAovF+sXTFqvBdcH9ALo3JEk8s5l69RxVh/N8eEKOI4px3E3qxQjquWfNC
         mHVCi9CiOZujn07XETiNIbmSS+1PKJWdUaMxdH/jw/ApMjpvx353M3BdDM8D/6a3hXb/
         Fe8aacmJcjet/NQ7Ti4uc+wqHKzx9hKwj3JYUG5cYuD3KX+rY4jiEKcbBe18Blviq3Oc
         UzOQ==
X-Gm-Message-State: AOJu0YwBCFBxobH01whrOF1PILpd+NPxPGBk7HbAX2Yzm6ShMLzpJvJR
	0jVe8BX77oWq06GleJ++zDQXVOhZhvR3jXxO33l5N/TakazdVQIIKHoM37MECUwW
X-Gm-Gg: AR+sD113LQFtegisOfRQnfD1CbYW5o3DSxLUtLgZ6AuaBbECSurVd4YPUB3BBxhWfpM
	Qv08VFEmX/s0Y+Z+4qQRVeZ6YxevUKUVXYkiRIXbbqapjN+3ozGZ3bieELeNS5Lc1USmN/49lw3
	BKwQeMC7IemYy+uxLtwMQEHurIgQE1fvmg8AJn4lFL4gNdj+UcalSidQiEqoFbEbqI8i0YIs2W8
	SdNkma7lHA+DRwpxbRxUzenM818VQaLXykv3t0sHEZkaifl0sc/yUqEH0ISk0rqO6fiAeWn0uQl
	sq6edA1LyIuobATnJyxLbqJxuZOB0j2NHSL4c7Kx4pn1RpEsgkuBhEr9ALKc9MOVRTNdwYOogDK
	ZRzxIjCXnByjLfMlXl7NhytYVfmVQf0+2n8rVGSeBnz4BE8swoqmJvQbOCzewSc63TxCZf5pIUA
	crT6uIHIFw705EXNG9TjU0cHB2Uo5sWRQIh1QmRnnqh9NM2T0ZyrmmmkEQMZOpAd9ieb3NrbKQH
	ADJFAf+osBMspIGRgBdIPO44pnHURdcG110546eE66/Nh+Co3lE/oG1g5w0vhnaaw==
X-Received: by 2002:a05:6000:613:b0:47f:9176:da23 with SMTP id ffacd0b85a97d-47fec48270fmr31695999f8f.0.1786092401641;
        Fri, 07 Aug 2026 01:46:41 -0700 (PDT)
Received: from [192.168.178.24] (cgn-195-14-217-60.nc.de. [195.14.217.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506desm3865582f8f.10.2026.08.07.01.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 01:46:41 -0700 (PDT)
Message-ID: <576fd334-3482-4ada-9b35-2e67a024e306@gmail.com>
Date: Fri, 7 Aug 2026 10:46:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dw2102: fix OOB read on firmware size not a
 multiple of 64
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Igor M Liplianin <liplianin@me.by>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, syzbot+f408eac9faa61d5a1927@syzkaller.appspotmail.com
References: <20260806-dvb-v1-1-a750f8e5b2ea@gmail.com>
Content-Language: en-US
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
In-Reply-To: <20260806-dvb-v1-1-a750f8e5b2ea@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/6/26 7:47 PM, Vasileios Almpanis wrote:
> dw2102_load_firmware() copies the firmware into a buffer of exactly
> fw->size bytes, then walks it in 0x40-byte steps while always passing
> 0x40 as the transfer length. When fw->size is not a multiple of 64 the
> last chunk reads past the end of the allocation producing the following
> splat:
>
>    dvb-usb: downloading firmware from file 'dvb-usb-dw3101.fw'
>    dw2102: start downloading DW210X firmware
>    ==================================================================
>    BUG: KASAN: slab-out-of-bounds in dw210x_op_rw+0xb6/0x180 drivers/media/usb/dvb-usb/dw2102.c:102
>    Read of size 64 at addr ffff88802bcf2ba0 by task kworker/1:2/803
>    Call Trace:
>     <TASK>
>     kasan_report+0x117/0x150 mm/kasan/report.c:595
>     check_region_inline mm/kasan/generic.c:-1 [inline]
>     kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
>     __asan_memcpy+0x29/0x70 mm/kasan/shadow.c:105
>     dw210x_op_rw+0xb6/0x180 drivers/media/usb/dvb-usb/dw2102.c:102
>     dw2102_load_firmware+0x2b4/0x970 drivers/media/usb/dvb-usb/dw2102.c:1906
>
> Fix this by clamping the last chunk to the remaining bytes;
I sent this patch to syzbot for testing and it reported success.
https://syzkaller.appspot.com/bug?extid=f408eac9faa61d5a1927

Tested-by: syzbot+f408eac9faa61d5a1927@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+f408eac9faa61d5a1927@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=f408eac9faa61d5a1927
> Fixes: 7fd4828f6cc5 ("V4L/DVB (8421): Adds support for Dvbworld DVB-S 2102 USB card")
> Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
> ---
>   drivers/media/usb/dvb-usb/dw2102.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
> index 4fecf2f965e9..4e26e1776977 100644
> --- a/drivers/media/usb/dvb-usb/dw2102.c
> +++ b/drivers/media/usb/dvb-usb/dw2102.c
> @@ -1902,9 +1902,11 @@ static int dw2102_load_firmware(struct usb_device *dev,
>   	if (p) {
>   		memcpy(p, fw->data, fw->size);
>   		for (i = 0; i < fw->size; i += 0x40) {
> +			int len = min_t(size_t, fw->size - i, 0x40);
> +
>   			b = (u8 *)p + i;
> -			if (dw210x_op_rw(dev, 0xa0, i, 0, b, 0x40,
> -					 DW210X_WRITE_MSG) != 0x40) {
> +			if (dw210x_op_rw(dev, 0xa0, i, 0, b, len,
> +					 DW210X_WRITE_MSG) != len) {
>   				err("error while transferring firmware");
>   				ret = -EINVAL;
>   				break;
>
> ---
> base-commit: fcaeecb8b0cd44f77d03b28de0671258d4db18f8
> change-id: 20260806-dvb-307714ff6225
>
> Best regards,
> --
> Vasileios Almpanis <vasilisalmpanis@gmail.com>
>
