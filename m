Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F6F3BFE24
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072111; cv=pass; b=mHNd/zWcP9e6JpTOTzqhpAHe5RO8W82GzyuKh8vMWgksL6+NguTUq82bmilYqbpBC++cJgAj3pDAQDKWT5vq9y6wbH203rnxc1Gkekzv/rGNyudEKvwmE0EF+qdffT/+IbnuKU1TgM1b0wFWPgd9Fp1iWNtiuFApoA5ic58/4xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072111; c=relaxed/simple;
	bh=yc4LV1eXH+Io0BAMwi9Gv0YWrAxfWPhlOmh7qYjOsMM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=lDpKa3qiS+gROVpzcCjzLeUa4NIvBevf+iUU7g1K2boVOn6+pf8U2sCfyMVL9Mn3gt9GZOr7UzigJKPrxsnJIfTyluIJIdSilfttjc6eNe3UiEPLcFNyvvQB1uKXhuc0l3HSm44R7SO+VfXG0Qy85e50/fQxZsNdIsPI76RdsG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DF921GFR; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DF921GFR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso3997630f8f.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 09:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773072107; cv=none;
        d=google.com; s=arc-20240605;
        b=LLVwmByiLEM5ZDwHVnUxBQzVodZFyWRUr9DzoLROiiCJmAwOP23i3vLr71/ggEeBPp
         eVrGzPsGS9aZ8TP2EDp1YdhwW1uVahD4qNugvR81ChJjT336bqgSILtnxRj+Dp04AGTj
         qxhfoRuLBDQbFv26NHZ5gjfmJIxafPVvP01lZuR0Gn2AXs75n/UYPO+dXY2CPQx9gI5K
         mgH1wpcB9RNX0B+nPFdkjbTFrx4LanAmtf1wqcAEmkjJAw6d9UuzNpFsT029jE4fMF4c
         ecIxjQxSZ4b9w7qLLkNiN+mjjslyD2iwT5g/0bv2bqMYb7zM7mRBQfsBIQalcLzF15Qj
         +QBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=e92Hz0H7Skm5rAzZUdJaMO994bojgSJy04NoOntHTCY=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=NpReyai7naoLAMIc7e9C11Vqd6M1su0QpuYbXWCR1MPuFgrOHYDdSd3qqMGMC4U1z2
         cFpHRPixsrEtCuAH+mYsQCUU6UpySsi/NSNlrN6N7gAwdm2sGqZKzIe2iTl4Cll47HJH
         cfXWssIuhX6CHZjVly/ovlG6YUTV6hK7BfNvmW8X2td0TwJbIw4qXdtdsCF/ILquRfan
         ru5jnCX7XA3+jCVoFETQjuo+4JdPuZQo9R/ASqeLpnyfOPJQTCVl59nZeKDZx3PQEnO9
         8rEq1weVz9BanjRUmtVlZ04ubG9Usk/bN0adtg060OLcbfywljj8hMDEcEb+lIzA2gH4
         dQsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773072107; x=1773676907; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e92Hz0H7Skm5rAzZUdJaMO994bojgSJy04NoOntHTCY=;
        b=DF921GFRbZjts6PPfuGM5hC672t/tbgUb6WJ6HtLxA5SZTb7DB224bK3fpuGVJ85+9
         YaMSgi8ChJ1R0qnI5ESfLCIEaJfkUSQB8Ox3J0oVTHeEo7v7IBEkWywQrkgbCHRe7XnL
         ERLsCyohH+pcDmCJG88HcUybiE1ZgLPA0f5/Itq1JkDx40qRsLQOBqX7bZM8aYAleV/X
         MZcfbjiHxxgw+bkb1dvEsGs4waqcv5C6sv6ksF6zxFv/OYEQZH/UmWmeZ5PVfpXgASUt
         Dv/hfap1semGpQ+W2QkchwFnz3RAmdmD4XXEqKMWLVN1roNA+c100FJAdGENRcqcrkLw
         mzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773072107; x=1773676907;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e92Hz0H7Skm5rAzZUdJaMO994bojgSJy04NoOntHTCY=;
        b=IhZrtWdStY6y139WMre3Zsu+2T601Tl6MpWRptZKK12SfJmaBKfw3eKnnHA6SVbrf/
         GDbV6ogAHo/NUS3IS8CymsPedDK1WweeIrbBAvAlc4bI/0JMKNylCnsf3Orbxfpvc5aW
         ETjaMpC5QVwwPEW5ZKNhyPbRTJg3S2qtjqtzGbuPaEihitau8QeYJgyfu6Wjp5vUdmro
         qetk7eFbaQcacomKxeDFsMgGh+ikleeEMZ/NtW4RmFmsSyCH1MsCJ4o/6F3R80j5grMq
         +8zzfAyTQ0Ry4zoIBPnwb1KTmNu2ST76K/b/fGMJ+FVLUG9Uijls9d22vn5f3fCaa2x0
         9slg==
X-Gm-Message-State: AOJu0YzEM1+53CM8V7GZON8geXtSrsJvZXQr9JUdwgjzKFGWgGkok33r
	HBh4n0GrUQsHULPxV3J1GYtVxEyqDMMo5Wd73UXTq4Gvku6BGF7sjbFYI0lzZHyCju9VA2WmgZG
	ItVi8rttuOHHXT+0sIHcgQZfH6sb/+wKVwpD5rxtvD7Uv
X-Gm-Gg: ATEYQzx1PgWBiw3Djz8r8wX25WiRIJZHlsyikqdsENpp14bNDFW0p+jpYu4EwuM5YHM
	77bRYI5/IZQ+btVNQaq5JUA91Y80iRQZ9eo0JRsXNtjOu/u5pWyqIrGCTqy6kJHhu/PNhmpBrNj
	Z/PVDyE9e5uUig39gR9eUDna+SkvCX585+/UcTuswdllqS/QSnyZkWUyg8kv7jel5Jkh/KDX0uH
	WrlYKCGHJBnE++ivxmNNL+vTiHpl3EGEvP6qLlwgUu2maQgNN1b4yhnTv+lR3Wm9dUJ5UBm1lie
	FbAhPAQVBREi/jpqI+GgPwvKhwmj8DEIzn1JjlhJ
X-Received: by 2002:a05:600c:3544:b0:47e:e2ec:9947 with SMTP id
 5b1f17b1804b1-485269784e5mr202256105e9.33.1773072105701; Mon, 09 Mar 2026
 09:01:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Mon, 9 Mar 2026 13:01:09 -0300
X-Gm-Features: AaiRm52I3uDPfRUtplTUB5UsSyOJTd9Ybxj4Sod8DcdQts1ZZ9Qe-9fFgWHHqMQ
Message-ID: <CAOKSTBu_aCODd_AxkBuA=sU=SJhCfVR7-FXo3tfOLS9Y=+1WHQ@mail.gmail.com>
Subject: No HDMI audio with Linux Kernel 7 rc1, rc2 or rc3...
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there!
I have compiled both RC1, RC2 and Rc3, for kernel 7 and after booting
with it, no HDMI sound at all.

This my laptop:

Operating System: Kubuntu 26.04
KDE Plasma Version: 6.6.2
KDE Frameworks Version: 6.23.0
Qt Version: 6.10.2
Kernel Version: 6.19.6-x64v3-xanmod1 (64-bit)
Graphics Platform: X11
Processors: 12 =C3=97 AMD Ryzen 5 5625U with Radeon Graphics
Memory: 64 GiB of RAM (46.9 GiB usable)
Graphics Processor: AMD Radeon Graphics
Manufacturer: Positivo Bahia - VAIO
Product Name: VJFE69F11X-B0411H

With kernel 6.19, even the RC's works perfectly fine. This is how I
compiled the kernel:

git clone from Linus github cd linux make mrproper cp
/boot/config-$(uname -r) .config fakeroot make -j$(nproc) deb-pkg

I also downloaded the mainline kernel from here:
https://kernel.ubuntu.com/mainline/v7.0-rc3/

I already tried 3 different Linux distros:

    Debian Forky
    Kubuntu 26.04
    ArchLinux

Same result...

So I wonder if anybody else has the same issue.

Thanks

---

Gilberto Nunes Ferreira
