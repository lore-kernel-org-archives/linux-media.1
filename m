Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448374;
	b=neTEcTQM9uXe5rJfj5wnYFY9R/AK0bOCd8kRpVtn6jIwkFOyIOOls1jGVeU4iYQYxc+i
	 W7mffEE5oBNP7R6tBpDR/Z+2x3pQ2NBBvlkn9F8/U2iCfJAezDjeS7tVaoBnkLXrCyvTC
	 tM/ihUGXxqZQlv9W2LvPNA9eK93dvo4AgxmB0T3vpEHUMpeSbD8rpbzCm/z01b7l5GX+Z
	 +Z1a/n0RtWm8n1SF88WbfvtFfUeYAJZaL6iHu/Cj360RvAKJ2xZUEwKxVSAHtJhHacvNd
	 7/65nAXI/o5GHQGvOEq75SMHyeM0jLCwEGC2UbqMYe0egh05UcCzK8OpqObFkCYGnAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UxcD60vypFeD+rkPrRNt2IzwXsigbx5g/Zsu5KVSY/E=;
	b=xyIJH83LrMJ5rOZ6Uny/+N0JwRmpbGi6Y2O+kHWmVm/Z0E3OVvdEsD+GXhKOadT/n6oZ
	 xiwYLMzKZ52l+iIkvw74xSlwRKeuSz3JqXiO8nXa4Jtm+5ndv1wfD8ICil4blNkPZ0YyT
	 NH72aP2MW2mRZNxfliScOBoLI2Gltm+eMez1hGVeiu2wyA0Sd4n4262v0xpLHy6TRUEGx
	 UqxylozFhdM+22ygb+U8YJXona7a3T79zwzqaC2g338dUPfztVjpaBpF4r1lsUnGPwMuU
	 +Sll1+fbD8NRrNkjYQBoHUWuSiQQaSHNMUgvRBN68CCtk8coGasmxhU8fhO4c2G3fWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BONvlEzd;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C376E606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C376E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BONvlEzd
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so5050679c88.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448373; x=1796053173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UxcD60vypFeD+rkPrRNt2IzwXsigbx5g/Zsu5KVSY/E=;
        b=BONvlEzdN+4eIigk5ksrU5CUUn+C8l1k5w7KfBzddJZMKnYTBof4V9qXhhIWq9pRsA
         RgirkIYqbgFIviwmfxTsAo49Oo9Bx50vxerSHJg4Hzs9wgzVWQsyPYoj0kAykRIFd5UN
         FeupGmCCei1I//HXblqFsXaXFmzJ1f2hDffsFibnZ3/abbZPtrvm4bzhROyHfkQSFs7P
         MpfV1vlVLz4+q1PePUfNgpl2EzU9F/T4yyp1RYpQsLrlogwM4neYr7KGV5ODHB9mvqpx
         IJd3r+A0EOTrvY4qBUuDrOdy0ROUiEj3oiXphaM/tcdZPsj5MjDU7iDdP18ljiGvZMny
         iuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448373; x=1796053173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UxcD60vypFeD+rkPrRNt2IzwXsigbx5g/Zsu5KVSY/E=;
        b=tF3xnIXLXYtd+q2jF+FR5FjBgL4lHF/quTT+HYepT6RLWm92EL3tMdJUJxaxlfL79N
         xHZXGdnZvYZ2NL/l9N4mr5WFLoBdujri1EpuDJy86XFTCwJCw102THTR+xQnNe8Fm/Yr
         0D69J7Bkx1N8hKgRT8GPqS9Mpj2/9vfIXpTpmO/G3ztnsoH+07mxKXzPgpKrG7izClsz
         uC6m25sxP01LItrWcuOwmHidlfI6gQVMsyMLev5eLsQTRVaZoq+GC6hidu7IPKVJ4a6l
         g3XPRZubsL24BfTA7QpT3QLRGXyzThtG/NQx8h5Jhh7P/NXDTLewQph59HwIPEkPN263
         7DDw==
X-Gm-Message-State: APuU4Z9uPK42Lg9m7CLicE9FcnlUTqPibginmYhY8f0lNkPpuDiYw6Ra
	DAJehed/75Xnajhw6BLkDhIKD/4YgwpNT87eSgfxy39dOs/oBQCu4cCL
X-Gm-Gg: AZFdTZcvyC47z1nkF9atn700pUgAmPiks1EjOKrdrW6HWlDqPZa5ceSvMuSwReOWEDG
	9WlhUGcS/6I/2Xz3nVDfm7LTZY0q9LL83G/PZF//cRrDBbRcLJjqYLm3cPS9SdYldGjW4az5TJq
	L041Sp6qHsMOWClMzi61OalvzV1tH6m6PaCJ0ZgOIJh+ItgXb4n8bA13kHvW5vKroraCNW6Wd1t
	kY5L5ugJbb/4yKPH0aBXrgKlxaH+lQE/df9o4rrbDG/qo23BYAKC+vxvh2UH3UTfNairLqWe6+f
	Kxl3QI/KecvQCoCKuDa0wxd48YS9Bta063+bI5aMdvxsupj6OiCv18knpMYPohp0ALzZflAaddP
	mVsb2QXIZTRSXKar6vHzY8nGK+qjGBhJ59+LsWfsEO+3YyVWOaYNqbT7enZC/YvOcr37EKrnJK6
	YfAbDLCACFvp9iNOW27MrCzhFXHnHLkeE5TpjhV/2Cw4wx0+4/yVi0rQconyD2wmRUVUOO1NHZ4
	wT+I2/1/njD/Z9ay5aBC+w6yDYwSslkWVeuMyQy10E5e3kn+LI7CaWj9fmWgDm2Frvo0UdVf7PI
	D2wQFESoZ2oPThhiaXtRkBuz37qzv2+8c/g8GNflMADNhek=
X-Received: by 2002:a05:7022:f513:b0:1b5:3878:aa29 with SMTP id a92af1059eb24-1b55690f9d4mr12058902c88.38.1795448372829;
        Mon, 23 Nov 2026 07:39:32 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:32 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH v2 00/16] media: i2c: power off the device in remove()
Date: Mon, 23 Nov 2026 22:39:11 +0700
Message-Id: <20261123153927.2547169-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Several media/i2c drivers disable runtime PM in remove() without running
the runtime suspend callback. pm_runtime_disable() does not do that, so a
device that is still runtime active when the driver is unbound can stay
powered: its supplies and clock stay enabled and its reset or power-down
lines stay released. ov5670 and ov8856 go the other way and power the
device off unconditionally, which disables the regulators and the clock a
second time in the usual case where the device is already suspended.

Each fix follows the pattern ov5647, og01a1b and imx412 already use: after
pm_runtime_disable(), power the device off if it is not runtime suspended,
and set the runtime PM status to suspended.

This replaces the individual patches I sent earlier for hi556, ak7375,
ov13b10, ov2740 and ov5670. ov8856, ov5648, ov8865, tw9900, isl7998x and
tc358746 are new.

Changes since the individual patches:
- Sent as one series, as Sakari asked. Where remove() is defined before the
  PM callbacks, moving it is a separate patch with no functional change.
- remove() now also sets the runtime PM status to suspended.
- The commit messages are rewritten.
- ov5647 and og01a1b are dropped: Guangshuo Li's fixes for them are
  already in.
- ak7375: the earlier patch called the suspend callback after
  ak7375_subdev_cleanup(), but the callback reads the focus control that
  the cleanup frees. It is now called before the cleanup.

Cong Nguyen (16):
  media: i2c: hi556: move remove() after the PM callbacks
  media: i2c: hi556: power off the sensor on remove
  media: i2c: ov2740: move remove() after the PM callbacks
  media: i2c: ov2740: power off the sensor on remove
  media: i2c: ak7375: move remove() after the PM callbacks
  media: i2c: ak7375: power off the lens driver on remove
  media: i2c: ov13b10: power off the sensor on remove
  media: i2c: ov5670: do not power off twice on remove
  media: i2c: ov8856: do not power off twice on remove
  media: i2c: ov5648: power off the sensor on remove
  media: i2c: ov8865: power off the sensor on remove
  media: i2c: tw9900: power off the decoder on remove
  media: i2c: isl7998x: move remove() after the PM callbacks
  media: i2c: isl7998x: power down the decoder on remove
  media: i2c: tc358746: move remove() after the PM callbacks
  media: i2c: tc358746: power off the bridge on remove

 drivers/media/i2c/ak7375.c   | 22 +++++++++++---------
 drivers/media/i2c/hi556.c    | 28 +++++++++++++++-----------
 drivers/media/i2c/isl7998x.c | 24 +++++++++++++---------
 drivers/media/i2c/ov13b10.c  |  5 ++++-
 drivers/media/i2c/ov2740.c   | 26 ++++++++++++++----------
 drivers/media/i2c/ov5648.c   |  4 ++++
 drivers/media/i2c/ov5670.c   |  5 ++++-
 drivers/media/i2c/ov8856.c   |  5 ++++-
 drivers/media/i2c/ov8865.c   |  4 ++++
 drivers/media/i2c/tc358746.c | 39 +++++++++++++++++++-----------------
 drivers/media/i2c/tw9900.c   |  4 ++++
 11 files changed, 102 insertions(+), 64 deletions(-)

-- 
2.25.1

