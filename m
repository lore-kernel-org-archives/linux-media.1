Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533543E16A8
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168176; cv=pass; b=O0eKHgui0iQbgrgBOIacc/FDuMw8km50IE//VZnVz9G65EFoWLz9ZDfudPOYCAi8t03BRpZtCL3qV6qpnC1TTyGKGANBlv9PvSe7PXo33Ng46I3TjNhVRRIp475+p5mOgg4r5V3wx9W82m2ys78fZiBTCAeS7I7SvanYkNvtYkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168176; c=relaxed/simple;
	bh=5aGYxWzpIdizAMBVvnP3Q8Dp5Aty9zq/HyVAn7/6pFg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=N9f02YKQfL0pcfsuVjeCV0wlyGy0Kdt5rFudL8MR3/t4dD85uFhVzcui13enHz5Fz4REUYyK8/n75NtOO4rMGaRSdKDQAgFV4Sp31oHyQXPcyUhKopilDD65bI0B79ih3wDPou23iEXBbSHY3A6z2WGG94HcvHH4mfJo3VtdXak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1ZPKsxl; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1ZPKsxl"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-786aca87296so1773382137.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 02:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788168173; cv=none;
        d=google.com; s=arc-20260327;
        b=KxKW0D+Qp1ttEpkKj56HfjpDjRk0rcff5c0IQplTvtZJKZPG1OpYhjgkIJZkBJAs7b
         HvoUFibRrS7XzhBwWGWFK4QNY4W6NOVSfFdom/dGpahhRjJqbS+eyBkmiemVsTSzWwH8
         Axws64FoBgLH1Zn7TupafMvKQq47Y1cdQEVAHTphsnn1P5ZQ+OmUnRYis83D7k+3lx4e
         VlcmsnR2htKbCPUQ1Ci8GtM5P+4sl1lqbn/0rIjSVyrlUij1QWrCqwS3XpKLaZ5xB/Ao
         1WmMzh05jXhiVLYlnAKpEmuBkPIa68rRRL2vGFp53X4jA9K46JOYPMX2kkyVYEvS3rRP
         wu5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=f4C8ZMLaV/MISxfV8jvIGrHl36lbxjwK/T0/Dx+yNdA=;
        fh=JKn2NX/v/5sfcKrMLFi5eMH0m/VObpw5+hZevhkXNFo=;
        b=d6b8QaMVle+ptSdDm3z8YaYalrHxWCoH7vrcAl3sb3A54GAh66DSg13Vc5pfDXpWGf
         7vDbWbDLnpvJXcAldz/w1cKfrJBjeCY31nKrOjP3+H1cByBi4nJn5jh2TDX7HKce4qEX
         qA+6hA6Z1mYtGo/tLIkZPSExWv/zP7Qx5y3uoE4OjzO+VhxA/vFx5jkw8ZXdHUu9bZFS
         sxii3HECbGyVlNnT8ZKpEsWhiNfs7RHDi5B8CDG5rP46Abh1SZgdezsL4ba0NcU3D5Dw
         NCtq4uE3M0ZIjKLDBjOyx/kSBFP3EPSu7wzUQ2TUenqhcknEk8PeCWXTqwQanMAadfjp
         /w4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788168173; x=1788772973; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f4C8ZMLaV/MISxfV8jvIGrHl36lbxjwK/T0/Dx+yNdA=;
        b=C1ZPKsxlWppPFbVHp2kyt7eVmxh+Sujw4oxhWpOfKJzXqR8GmQKcQ30em4xfK4h/N8
         vidpn3jD5Mk0maOkU920qLoWRUB2/LmG6hAk8FGwf4Ij4KRSo+GHAO0/goRiAUkTL7TN
         88qOHxKJmtXwZ2kDsSOk7wy6lYb2bCnTEJNWVxsTKfur4sucq3KQS6BihOTCPvuyMqr2
         DpMCuHbUW8sbkCGCR/jB15R9/BQSRQJQklbg8SAl0HUyW8Fo7oKHsEZaME45OHD/7fTg
         FRYIJKEL0S7afzhFpbMM/TUF34pOj9x7y5+6LqLMAdJNm8x///KIWpURNA4vmQRMcPHQ
         I4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168173; x=1788772973;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f4C8ZMLaV/MISxfV8jvIGrHl36lbxjwK/T0/Dx+yNdA=;
        b=p7J0hbJzQdoeaj6z4PIXPM54FlReUpI+Cctv2wXf5RTG/Mgfz+UEpau4mIIfgRsjXB
         dPNR7pa66FTLEhzq4XhKPRDJ+A4Ifp2ib21biuiCIr8L2iLR6OQDmPxKFZR0M05zUrbk
         ukzBxxosCgvEi7B44u+xNujnvYWKDwa1QeTlxhstKzVnl2hL8YbsnIg1cOgCburnAnOp
         rdMjFqnNaJjPbhauMa/FCxXFOe5sovcnJbfPB1il1oj0xBMriWBi8mdXQwcJGC13j29b
         DgvuwVBy5dpeBQm4FbCcRUNuHhBcawAl6MQo3xQMHbX7Y7lPREXmn0crJm+yWOFKNRCq
         eWPQ==
X-Gm-Message-State: AFuF++mzRmrvuxn9wAFalX6OkWmcJoeNMYad0VH6GdMdzW/rwK9sr1PB
	9fOZrOtw6MC10QNvQimNPDn0q28NixUFLs3t0+xJYVogl4mLQOjHIeQ5SnW9FIs0Pr1utQTt7Ql
	ADH+tTH3slfbr51tsYHseXn5s8yiwYk0=
X-Gm-Gg: AR+sD10phKDR9L+Wt386GIuiJRTYNurzDMuFqlgpGT4ZxQY14UJbvb+bWEwnCm3mN9a
	W2fT0+QkCLxlw7bX6v/RoYYnYtIZ32LmlCUNo6J4c1I1qfl4Jv5t8eV0Ep3CuxDIa9R27YcT8Cp
	GAJyB5hEHYvTSN4DXtNNM9Ad6El6Bdy/bjRwRlNdITTwKdKVHYruGmvakbI9NRJtzYnp7NoOk6V
	CdE2ZwGppRQOKLTHY/ytTAG9IIFyi0l1JEbuoKi3hzo3gtD1UxPTGQc3oynHtDDiDS7gQRX0rIW
	njgT05DIx2OCxxwAafK8Ib2ZRCxipSBFkENHJZ+sIsOK/Qk+rE+wHI9OULLMRIVwFBqJbzNNHyC
	d
X-Received: by 2002:a05:6102:f9b:b0:77f:7df:ddd2 with SMTP id
 ada2fe7eead31-785972e710emr9591999137.1.1788168173106; Mon, 31 Aug 2026
 02:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Xianying Wang <wangxianying546@gmail.com>
Date: Mon, 31 Aug 2026 17:22:38 +0800
X-Gm-Features: AcwNN1VxHmoqQRhhZsQ23eUyyYFi5HXQVGYoAwjgcjV4ph4CWZUZ2jKULw6WLKc
Message-ID: <CAOU40uDkU0mUvnBv_J7CWPfG-RAtYo579JnF_OezDSu7LPig_g@mail.gmail.com>
Subject: [BUG] general protection fault in su3000_i2c_transfer
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi media maintainers/developers,,

I am reporting a general protection fault in the DVB USB dw2102 driver
that is reproducible on Linux 7.2-rc3.

The reproducer connects a crafted USB DVB device through dummy_hcd and
then issues an I2C_RDWR ioctl through the i2c-dev interface. The I2C
message passed to the adapter has no data buffer / invalid length, but it
still reaches the su3000_i2c_transfer() callback.

The crash happens when su3000_i2c_transfer() dereferences the I2C message
buffer without first validating that the message has a valid buffer and a
sufficient length:

  Oops: general protection fault, probably for non-canonical address
  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: su3000_i2c_transfer+0x549/0xdb0

The relevant call trace is:

  su3000_i2c_transfer
  __i2c_transfer
  i2c_transfer
  i2cdev_ioctl_rdwr
  i2cdev_ioctl
  __x64_sys_ioctl
  do_syscall_64

The syzkaller reproducer sends the following I2C_RDWR request after the
USB device has been created:

  ioctl$I2C_RDWR(fd, I2C_RDWR, {
      msgs = [{ addr = 0x1a00, flags = 0x9211, len = 0, buf = NULL }],
      nmsgs = 1
  })

This looks similar to the existing syzbot report for
su3000_i2c_transfer(), but I wanted to provide a fresh reproduction on the
current kernel I tested:

  Kernel version: 7.2.0-rc3
  HEAD commit: 1137d8b5df06137fb49513cc923b3b24d94cb809

Full console log, syzkaller reproducer, and kernel config are attached
below.
HEAD commit:
1137d8b5df06137fb49513cc923b3b24d94cb809
report: https://pastebin.com/raw/YT3zKcrX
console output :https://pastebin.com/raw/UE2E67ws
kernel config : https://pastebin.com/raw/k2Vq1fKj

Thanks for taking a look.
