Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795601359;
	b=L0UcM7mFh+Pj6/F51CPwXRDiT96jvASM+d5ofbxfzp5V7tU+MRBtJianaK5V0E+KYMH+
	 VQgrGdJd61IOgiy66orZoTvq32sSkR9yIGhRE0KAkvWqgGufGkYFa9jWnifY9Mq0oDDM0
	 ENriw4qgGMkj91u06EMzIHWUHpON00/I8lmZE8q4zxhoKlAHoxqfgGtpeDMb+O0RZW7S7
	 91gmw3U+GJHiCtzzkEKFa1MqKFjS4KBXi6uMD4fhqWo8EcvcExw847ZNQNK5cUIl44q4U
	 wnn8ZOgz2xGAExpqnvphlCzw9S992LGr5Ifw7iaL+N2ZBk0z+14O5yfMRm82yYMxy0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=g4uSHTuSupEF7BKh02dDIEM4ZjNpMAjKJO+GhROZeDI=;
	b=zWCoNx2cwJXs1I1t/QBKpor9i8/5fmUQqlP6ZnHtINfM3ME46FZLRMvQDonaMx4El8Lo
	 6UdloeihL/qmueWfCZOgst4pvP/r2Hfx8qNxKoTk7sVCHB60tSNFSUvRfy1HqQ3DC8JF2
	 IwZLK52b7exJghL1ALdBXlFWmhontzSPB3GwfE6gK2+vPXiaOzqX2UOQcHKT74MLVbyM3
	 +wwmfufy71ie2bSSjZYHmIpzoo8oHL4nLEE0Mo6lCqScis1N+sEE75b6Cb+hhKSOelRpQ
	 V5R+N4NlE0wY2yWywF3QPoTlwQDMuFhwvAz8mP3v3Nt1ZmpltdXD56StnvdK/BSIQgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h3cJo/Oi";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5500606A323
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5500606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3cJo/Oi
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c14470729eso5172045e87.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:09:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795601357; cv=none;
        d=google.com; s=arc-20260327;
        b=ey2Yxn26FcEwTH7DF+runpuvLZS9BwiqNXBTydngOYlgpDmpQ1yb8Ng9KGyzMI+F/o
         ebPocGB0Q8V4QxWxbKUG6w8diuYzXyfqu+PC5mZuwg7mCjXQUe/Bi7nwGyeTbl2Q5Nai
         +4FCbpTjysE0EFaJ6krLFB/UNyoKZNWbcJXb0/U7nkvdgG383/XTOIrkex0RmP7oXLJz
         zcJWAn0sS4o3S8DTCqWcDkOU5L8Q90eBNr2cGPh/4oZB3jaBsUZRkXAIymRaXbFndYcY
         8rRaBFC2qlkBBVlnZi73kY7Ma3BA2SrqEA0ZbDLnuUZDokBrTlKNXE3xuL6ysKAymtla
         kWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g4uSHTuSupEF7BKh02dDIEM4ZjNpMAjKJO+GhROZeDI=;
        fh=mJd7E0dLSWfdcyBd1QIuOVLaZLVRW22hmO6+R3j2Qa4=;
        b=fGzPvCKIjNCyaYYC1BDeBCYZz7lHxQKPR0AtWbzwxgsNOsmReXj9LS7vOHs2Nx9Z8w
         Q42pmhp6g35Dj3WwuPqL0LeF5Sd9MJBdfNvw1GzDOKHrqppjiW2KI1106lH6lSsqG2+x
         ldKtL1AL1VVZVFrAJDswzcwMKgCN8LlEDCu+1u4t6n2s0KHGZ9w7dbb0Fghht8M50h7F
         I7rIpkUuladfewvjRK3M1+1kUqsJJclk6x7Zkrn5RS5bfLTc4JOlK7DfXYcoVkdPY47M
         R8kPkn8bhlfujRary3GHcX9ojwDHjp8niMRtWh5BiApcfpmRQOsfjO7TB62rtFcqXJQr
         CQQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795601357; x=1796206157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g4uSHTuSupEF7BKh02dDIEM4ZjNpMAjKJO+GhROZeDI=;
        b=h3cJo/Oi3qzBmWTRAk4xund5ZkzQsAd5WZpg71/CQukN0FvA5ZzlBoSQYcPJDqx1mT
         +R8XzKcw/qxpF+fYqQQqp/QEzXCG+UshSYaMnUMhQNTJQLgpZPPjvSX01zWKHhxkkpWs
         a4DAUdPoHqPBSUXUeI8aKnFs1OiMAIXxFPCNBWj1kedtBeFblHvsxKO1POzRWytRtH8x
         rrMdzHWC09MPXYWAAOdWjjKFQETBLoRHaqDVmDvsGfJ3/8kXc11vZp5fXm8HTqemn8li
         sVNt17B+GRdUyZ3tVGAkXGEFJLU/jxdI3jK29uOiJ48OMnemE8OqcNHbswFAV1M26JFY
         auDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601357; x=1796206157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4uSHTuSupEF7BKh02dDIEM4ZjNpMAjKJO+GhROZeDI=;
        b=22jJyCm73axYdLkXWNvll1bqrcINEO5rD/GN2WlzDg7y5kKEvSvzfujszHx5EfZJzB
         mJ2VzJ+CuPovtd6QSzlQNQBbanLJNP6qu7b5Ek/EQct6ZNt4lfAmZnxl3kmmGH01wuwD
         w5Tgwt00CZ6UMnLzC1ogsLZ3FcKmAxenLAvAtM4m5qGKRtvP4v5Jf03Czy7h7J+hKt0H
         /P16TKsx2jT5Wl3QgI1HJOIwHmIyXew8zcDwCdCVlbQKm+GGp/h7shN5bEwW2pBi+8j8
         wBym2fP68QufGSQyF+ZEwE4Itdwi23kyp9JofFuVX+XH6KD7Ujuu81slDyVB98Gd+qvA
         kSDw==
X-Gm-Message-State: APuU4Z9SX2wAspRDqSKWBAKlXrLbPjjueRk+wEz6CkYyuIzWrsPh9E3t
	YRFcxeXG03Mbwgj3RKHnoaeN8XekZTcMgptDaBL19jxKTteTc3UlNhwRSQ140bg8Ny92mQq3n/W
	MShGWsZU583zhRIO3XFbnhq/ezM5o+nOWb2osuJc=
X-Gm-Gg: AZFdTZf8rxkavilrrnFxQrOBTdpY1zAuioUy7zc7NPA080GDOIxntWxy6CjGJdotmTm
	NWjfqZlbLcJl9QoMn1GwBVf3BQqs1hqPt9lZ4AGvwhq9pTodfA7qybJFZwmk/BTbv8tcKh1lQdx
	z5KsEQWlNKEpN1fpbAZw3HpwT3MaZX/LbGpUMdOPJIfVeL+rARZjAhMRMNekshdkEGiPIFYqQ2k
	SVhplDl7ulLS+NDUZiWlaXzv2jwpiAO7MeS5DvWQj3bk+hyD9G7BC7wYRqDzjW2heLXh4arYqtT
	k1fdTdcqkUO/s4MQoPbRrY59Yq8nN1K5M/84YSt/Mpe6fMx6q8thG1wo6h0Ui4DevPC9Zx6CdPr
	kEwtargB4KN7KnW6mvBsWQLphVlp1i+1dg43aXg==
X-Received: by 2002:a05:6512:3d19:b0:5c1:56f6:3fe6 with SMTP id
 2adb3069b0e04-5c1bc865d40mr4676626e87.47.1795601356741; Wed, 25 Nov 2026
 02:09:16 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125070548.28989-1-hiyoukou@gmail.com> <6b06984b.d643d4e7.382b4b.1296@mx.google.com>
In-Reply-To: <6b06984b.d643d4e7.382b4b.1296@mx.google.com>
From: =?UTF-8?B?66+87ISc67CV?= <hiyoukou@gmail.com>
Date: Wed, 25 Nov 2026 19:09:04 +0900
X-Gm-Features: Aa3M54rng509f16LERfcbr87Xk41bRqNFFPQdaZo7duBkRdJ3kw6itJteDo5RxI
Message-ID: <CAGf_h=Di6+gBbX4iPkrhrgShLZsgSJbEQFuYTdZanqxcV8n07A@mail.gmail.com>
Subject: Re: [0/4] media: zoran: fix capture buffer size / geometry desync
To: linux-media@vger.kernel.org
Cc: clabbe@baylibre.com, mchehab@kernel.org, hverkuil@kernel.org, 
	patchwork@media-ci.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 25=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 5:11, =
Patchwork Integration <patchwork@media-ci.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
>
> Dear Minseo Park:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
> # Test checkpatch:./0004-media-zoran-add-KUnit-tests-for-capture-format-n=
egot.patch checkpatch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #67:
> new file mode 100644
>
> total: 0 errors, 1 warnings, 0 checks, 150 lines checked
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/117190=
231/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>
The MAINTAINERS warning on patch 4 is a false positive. The ZORAN entry
already covers the new file with a directory pattern:

  F: drivers/media/pci/zoran/

Running get_maintainer.pl on drivers/media/pci/zoran/zoran_driver_test.c
resolves to that entry, so there is nothing to add.

Resending would not clear it either: the file is still new in a v2, so
checkpatch emits the same warning again.

One thing worth flagging though. This would be the first KUnit test under
drivers/media. KUnit itself is well established elsewhere in drivers/
(clk, gpu, iio, input, iommu, mmc, net and scsi among others), but if you
would rather not start that here, I am happy to drop patch 4 and resend
1-3 on their own. The fixes do not depend on it; it only covers the state
desync that patch 2 fixes.

Thanks,
Minseo
