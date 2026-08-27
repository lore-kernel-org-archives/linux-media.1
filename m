Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057B936494B
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 05:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787807727; cv=none; b=ex1k1ZkeQ4GC0VBERByoOD7y5ovuJ/p67zqEz015cFY+C8ALMK/xAfHUFBg6ssetDqb8WkPpvvSHgnIHAy+LlA7QZguAsLQhADlF3eBPIQ7FX+GuqnC0CJOjO0k/qwsZ2zZGysySNiVzJfa+P1rLQ27AyxfK4Yg3K8jXtdg6gA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787807727; c=relaxed/simple;
	bh=uM4ffWRXxgqJu6oQ+yqYabPlZlqlVfdb1R0U6/DgtsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIebZTegB4eJr+mUaao+KiGojl3y/Hd/7aAQ+gmQF5INzAGEtEHfMEJW1Q35meby8jlz3WQUu7kUO4xelaM6HpTY6S039GdGss1Pm/COwOEjRnwrietkc8N+OC+dHSYrM6d3naZ2RZPn0XWYJuxU/rCbducTzPSw3Oo/7cTnj3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qWzX3N4s; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qWzX3N4s"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caced6038eso7406245ad.0
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 22:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787807725; x=1788412525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7iOkDdvwOpGToX3CuLu1TzqG3e80H5C6wqSpJxbfBo=;
        b=qWzX3N4ssA8hOX82cMRVj3LVznCWUzn7VC+Js0gAlYZWhm6V8pcHmhJPS5DL+4994a
         ZPbiRQMX4viy8QvEDNjT7moZnkqo6FtLKWMoelRbwhE+Z00cz2GEYiaO0gFnz9OfEQ4l
         VP3Ikhk7EThrbDuwR+l7Yb8lSuBw6uqLIGvJl+1qPprgthyAeSklMJXaM7hAd9Z18Ice
         NGC/e0GYavKghVXz/M7lBTJsFCChixGGIcD2qmChYTRS2BBxZA9Gzfbp8hzM20degPy5
         AWpVHI/P0zkcYmhzDlI9jGA1bSmFCqinAqHlcP0w5u+z+S5+Gk1Ms3ZvnMcwYSncqjRS
         zwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787807725; x=1788412525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7iOkDdvwOpGToX3CuLu1TzqG3e80H5C6wqSpJxbfBo=;
        b=os4tkb+N1qEMOVMMO6EIAph6pn52Ji6/7R0Q5lvmISqFLYjtkqPVn7nibELjxAZsLh
         RLSV/eWP+Jj/5yDRQyChTwIGPpAlfl8yRZkC2BOGK65jnboxkFIE9teaXmRbrBEbKOlS
         AqgQoK2O/1KBMMF3+PapNg+HG0IKFdwZWH5YoN7X1WaaFzWeM/AgVH080sk/aChhnK4Q
         n8JRCs+PVzJO2CnTZFMUZymvv4AZRQ2jalkgbcGZWuxxm6bjkXJvfW/AcskVUW+C6D3f
         NEVxPyd2CUBaqnGB581PLcf5OoGzk2V+zTNiIaNvFo7jDXpRzQ5BPb4+V+1UK2MMqOsV
         pjRA==
X-Forwarded-Encrypted: i=1; AHgh+RqJbVDYruguYmdVhcCRelRjxHqrbms9o8os/O9e6Y2qYDtT/MtB/y6skc+9jjICvZqznLP5BaQNaGZrlg==@vger.kernel.org
X-Gm-Message-State: AFuF++kcyaL71h2BlrfF6P9S1z1bP7AAftgfCVmvAQJPHs1z7jDZkklF
	d3GK4z+89wgwl8djue+HkOhCI8SDHITIliIpqWnMyj8TxOrDRnjDn7EY
X-Gm-Gg: AR+sD11XuPcnlWz0SYOgY0u+1zzx2MAMTVMmBB+8hiVjx7P76iwuPcvmvx6Aggbs+Lf
	DT8ls04r2S/zfStaqgsHQTX+BisjMBW/Oq0u/i0Wwa5G9z0fENs+89lt4v1oUW9HzsR5rQWKgQH
	b8P2ycYFXla0pJuKHNOeTGwAHlym2ylnY1yyY6JfpceGMy+KhJE4Xz+eCA35/Fjpm3oRq5DKvpw
	4fK/4oyx6vmF7k2eRGx6NmK26EFxmgREKzs/EifZK3m0JtwEoqGgyT9iUbRLENuLdLzO2GZFpsJ
	7DwggoiHkuz0J+dqTxC35ffe0R/UoKpBx3hJS+D5p2yD3MteJTGizxJrQCWDmpFb3ll967V4wCO
	SO0ASMAFB1EpN2PYlVtE9nlEdR+ciERHZe9lc94R8ZeZvL3xRIoiTD5Jn5Gc/vno3RP6Ccccbq3
	H/x8jXZa3QDass4+TIJfl1opJGK+xte31tb7lwDmQ/ra7W3GFvezBEI+4nXwHbw4FsNvQfcf1VS
	rup
X-Received: by 2002:a17:902:f647:b0:2d7:1cbd:9ceb with SMTP id d9443c01a7336-2d7269d6badmr53564155ad.12.1787807725203;
        Wed, 26 Aug 2026 22:15:25 -0700 (PDT)
Received: from Default ([2409:40f4:1012:4330:756d:2890:a615:2db9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d730c3csm15176377eec.9.2026.08.26.22.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 22:15:24 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dwlsalmeida@gmail.com,
	jeffinphilip14@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	stable@vger.kernel.org,
	syzbot+c7fc4794e59786f5b4dc@syzkaller.appspotmail.com
Subject: Re: [RFC PATCH] media: vidtv: fix uaf in vidtv_bridge_on_new_pkts_avail
Date: Thu, 27 Aug 2026 10:45:08 +0530
Message-ID: <20260827051508.13989-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026082737-traitor-shorter-a4cc@gregkh>
References: <2026082737-traitor-shorter-a4cc@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 06:51:21 +0200, Greg KH wrote:

>While "fun", this is not a normal path that users ever will hit.  See
>this thread where I propose tainting the kernel if you attempt to do
>this:
>	 https://lore.kernel.org/r/20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org

Thanks for the reference. The task hang is not possible
then. However, the UAF will be triggered anyway as we are just simulating
an unbind. Even if the driver's .release is called naturally, if we are
streaming data, it could cause the UAF, no?

Thanks,
Jeffin.
