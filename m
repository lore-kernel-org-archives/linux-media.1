Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2626D3BBFAD
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 05:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895571; cv=pass; b=ZnreNtAnvKQfJrs9DSJWOF7b/PnCGsW/CAx3/Gjambg4FpUqpy9Yh8E/7dA+cz4C31wp4wa4QFQ3nj9o1dbZhNSr9rHNny9GL73TLDGGkFjG5FzY4dVFskAI0bcZxGbxyeYgGFZ42SxinaYr6nrujeX6FZQSzbDg83AzUbXL4yE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895571; c=relaxed/simple;
	bh=QlFU02FBYD0ENAEhOFBlExoO6aYJwlHfJ/OcJVUiWz0=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=GLbNTgQjArpY7HUjzAUcetsHuMzbA/HdX/Nlc8AqLYazNeQgZgpPPAlJ/XpkYxGrCy/RLDmqUN/jAv9x6ZG3wroVNGOQk02ZGSUXSp15fhS+QRTV+O0zHs/OCtspNKQNVMKrjDOoe5v0ReTUSWiGVSM3Fw1l8x8LGNhZ4REalsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=prDMfhjj; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="prDMfhjj"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so781867a91.2
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895569; cv=none;
        d=google.com; s=arc-20260327;
        b=fQBcSL4iXRS+ZTiRZhGw5zvleodRzPiJCovVwxVkxcKtfcAVYb0xuoMZHVziBGR3NU
         gXOGmpSpjplCjVoNutlED0I0Q6rU4kl4UxFbD0TVLe9KsJzLe06FkV0ZDNdc5PTsL6GJ
         /h3mobkJaZ+Y7RpkznFKtV76/al12efTXM8ceakP7trKBarO1beUjYf98CXO6LOmcOwY
         hKd5ABAMvgz5EXA+n4gZ638UtQWgXdMXHqc03X/u2Kf5FlaE8uHjLAhEpJpYojOfZ3r6
         2C7HYhmnziO9wPimN/6p4zJFG0XSW/ocmIT4BWhj0BNAkMEwBuhJpxnu3Adff0wNhDG1
         8a1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=yd8Qwd8neh8JAjIOJMhy/tdm0ISC2f6EcJu5hMA0lJc=;
        fh=2fJy3ukx5d3N2TwPN3dgYMOe1ryghWXl+oGpY6GQ2qk=;
        b=NxMAFwiUM4YFjWOq0gw1MFvHSD3ZyDWiB+l0vPj4bLW69XUF/A5zhtMkk6QJXfGDcx
         DvZW752duywwc3XT0Z8ZPl0D3N0zc0a+eZnRWhS6ec0JarTEdDB25ueFRfaghL7f/8Qu
         WOjJmAoucUAjpQYdQ/5DnO6IjgmgR5lE+VQLwM9wWz5CNtqV/6w1fdz2mq2xs8z5Za2V
         ZbEoZ2ZokbnCMpKK1p0AN9K+Innl0wHmN3pdiWa9p4hpSiU+elmRko+KAE6VFq30G5bn
         Pt85DjG19QozanUk0TCleX9e32tzjEuOhgyXtMKRQfJHXc3xd9yuwJoQzpiqOrH0JivR
         TWnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895569; x=1788500369; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yd8Qwd8neh8JAjIOJMhy/tdm0ISC2f6EcJu5hMA0lJc=;
        b=prDMfhjjjZa1jNgH7zxJQGeAd/D4Tp8sumUnfbTEUgzCmJxcZgbiZ/RZisSd3sCMs3
         se3UcndmMLDNB0ULHHeHo0utfOVe7DD14B/hSrhMDKKpyi5mbgU0pJMT+orThqHkyZZf
         Qxig81kimbtdNTp+ZCDOOFol4fpNsElLiHCuS5iUoUY4l8DCLcUmMzEekSXOM91pCKCM
         RBNKXAraHEt176TU4jfUXKMGNQFQyKneBFXElKpkh3KJDk9L7lXpgLSeEjcQSdEEntJD
         eSx2AnaJUNUivSLbnk7qWGqYr2f4dcCuxgLLd3AvEIdbmxPopbQQfhuJtRQh5ldsFkuB
         Zpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895569; x=1788500369;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yd8Qwd8neh8JAjIOJMhy/tdm0ISC2f6EcJu5hMA0lJc=;
        b=o5YLJU5iejpquJaueYyrvpQKR9ZXSOTmZC/w29Lh+C8tV5U3GCCFmL2bs/F/RQzm6J
         fOHZEZse4wLZpVXTIdZyL2iBEa7zRhXkBYC8K5z7Ca1qrBpksLMxl7au5Ksgqc6wQ58R
         r5tiLI+VjsdXXqoEptUqR1SP1Hm6yh1oAGRnHb88AZxkDytEddnADIs5L06LidIv5Zeh
         J6OnifJ8aBnzK0BP7aBn1OzdU79XLilUljOHP9nrbajqMOxUpgVcHovCBnrrWmsGJOqw
         oZjDhMftTbH7JF/0tuGcI3UCpcOsVowR9LZaq0JoVlrkaG1yDuu/ogFUn1UXbIjGZa5N
         701g==
X-Forwarded-Encrypted: i=1; AHgh+Rr289K+SDBIvg7PrBUuQkjGYLjcfTLcZB9aLRy4aXvcZJgOZgBhtwiNeuI8a9ELYpyyMhdQ/yyaOSaW0Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nlFiYNXY0pmkka3unlCu33/qRDLF2nl0geDpbqVF1DV+YEU6tb
	UzCxAzBnbJ5q7J7b/eHUQC2hJIQ48t6ZYKRsvhYvzkmKjcEgAMRoF0EdPoqUMcUysplfBLgLJ8y
	z3F7l6zuEDg7uRHFZvVBghOmluYC11XSmrVLOtgR4
X-Gm-Gg: AR+sD10QsfDfScdwXj9napR63mzYtoX10B5hIB4JQVfKD2imaAIsqmRSpWMxnw19a78
	ptK7x1yJ+LbbFUTXizdo3z8S5zFFl8UKsxS1kBvOH+lhKpVXxjlLGL8Si5k+AO2UPSheG68sJ9M
	O0aT5uvw04tcWJqEL3MZyqju/8gU7yasvVpUlhciT4WRf+5KUY3txVmClcm0THFDnobdNdBoDS8
	boyyE/ESCrT1D6B0zn6R8zjY6iUXqtRjEcLZDtT43HPrdFJ/cMmKxxwtRtHWJGgHqZ8lDfHC6Xe
	lndvobNNACyqgO8hk6LReYsgTkuLSDyE2MnEdzmEGR2s8NqsDwgkPh07Vxz19CdIk9B2KRBQTvF
	nBWGmdI2acrH4naE+BHNX/vDtl/TwWRv2
X-Received: by 2002:a17:90a:e7cd:b0:395:f0e8:9e13 with SMTP id
 98e67ed59e1d1-396d0e71ad7mr8017597a91.7.1787895568571; Thu, 27 Aug 2026
 22:39:28 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:39:28 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:39:28 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:39:28 -0700
X-Gm-Features: AcwNN1U4A4Ylj8SXf-cbazZXGr7do-xqISWUKchmfzBIts7bvvDX9NmKXUnkglA
Message-ID: <CA+0ovCiUbRrx4rYhmZaRU9ypM8rF-Ug0YpnzC9VwL_-B7rM6ug@mail.gmail.com>
Subject: [BUG] WARN videobuf2-core.c:2210 -- go7007_stop_streaming leaves
 buffers ACTIVE
To: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/159-media-go7007-stop_streaming-buffers-active/

  go7007 3-1:1.0: unable to reset the USB interface
  WIS Star Trek or compatible: error transferring firmware
  atomic_read(&q->owned_by_drv_count)
  WARNING: drivers/media/common/videobuf2/videobuf2-core.c:2210 at
__vb2_queue_cancel+0xabd/0xdb0, CPU#1: repro/9514
  RIP: 0010:__vb2_queue_cancel+0xabd/0xdb0
  Call Trace:
   __vb2_queue_cancel+0xabd/0xdb0
   vb2_core_streamoff+0x4c/0x140
   __video_do_ioctl+0xadb/0xca0
   video_usercopy+0x876/0x1450
   v4l2_ioctl+0x18d/0x1e0
   __se_sys_ioctl+0xfc/0x170
  Kernel panic - not syncing: kernel: panic_on_warn set ...

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
