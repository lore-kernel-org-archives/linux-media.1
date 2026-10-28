Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180665;
	b=TR4OqhsvJrn0yLZ9TbcgnTITBRkm1aKwHpfRuXPfwq/X9/mA9oJ7oeX+hrglOzk/bLao
	 eZ1n5Afn11bVjyTQTnX9RTysCFzuTGMbPa+V36oFayTOKm4OlJylBxJKbOZ5xJuRQXrwY
	 IO3Ps4x9eG8kqNqkY9wvzDcvJekTmMP63KFJIYStfyh8TBTd7zflaJqQ7WrhZw32ci0RE
	 A9Ym01naMAm3BsTvd2el2EIWsgS9lwBedvb1ZnkTwSnULjAIQHvC1DLIO7BzsmwaTYldJ
	 24YVkvhQqEA22PLAXt9poF+iA+IAQxupPuUg0Jjg/1L35XJ8mhl0cFx3Nefvq9guOTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AGi/fq5S3uVapjyEXBvCZExutq4hUdJTl4OnYwdmmHI=;
	b=LlQc1LuYxhnHGpdOmO3hrKNdDz7UI/DjEhlo6N4n/wWKHfeCYn9kBs55orZAFTaFMhCG
	 ONbZJUciGaZGL/AkQkP9ZFt6AdD3GTXxj5CIal8Ul8zkWRp3uJycLcF3nqMGwJhnbRXVm
	 Es8bt78M23HjaNqZqNGyAJldmdNHUTuI2x+THXanjrXi1KITmNHn8AwA0gY2iRfXkw86i
	 VTQgNPl601ri+v9GuEaE32WGtIthy6q93G+KIXJp34Ey4FucUKlZF1zr/WQomRlS2bKxj
	 1wcJLMgd9l8SO3mlbXLZWmwKEG9wWcGaYpAP2HrIL6V8CCQV1EN/6w6EqS+qQZSx2AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGaw0Tu+;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6AE606A31D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 09:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB6AE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGaw0Tu+
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e09aa5264so362658f8f.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180663; x=1793785463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AGi/fq5S3uVapjyEXBvCZExutq4hUdJTl4OnYwdmmHI=;
        b=yGaw0Tu+lQn1sWU7zA/mYAVKKBVR7nOAu6mb67iT3zoNq3Wp87S2RrN1/EflDlYxlT
         IRl8yR5fwcy/Zva++3P4VfLi1oePleYWxLyL3MjDpjchi+eLR3kTIt7XmSWXkZzfn5so
         Yz8lK3F6RFmsXHjCOnI05kV9BA+ebH/uB3YQerXOs+D1oxf1Uegg59kBAk5YqcQx+kcO
         ekpEoltSWiqwmyr7O9Wp/mPFSsDM0JeIVZR9Id7wwErOBW4YZNBi6auE+TjCNbWLn9iK
         YJC6rJFrH910ayxEpYvnvIUG2IEl5VyAUAtWGTtOCGCDzw449oMQBXvltQi8ONU3I0+M
         yA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180663; x=1793785463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AGi/fq5S3uVapjyEXBvCZExutq4hUdJTl4OnYwdmmHI=;
        b=FsrxSnIifVxFtNsiRvVV+ZPXVIZYb83pJBlCnsPp9/3Oy10s/1u2zxp8EBPsm7LLbR
         NS1yaVowETO9WEy6FIAYOmH73MgmePTAMtwqqlW8Hgg4uF2p63BK6UvO6Dq+H/kt1nQG
         f1VBQ9Kv3ITUQugCA3HmLtBBmqOupUdT4jDElV0uTzdBN1AYmCbR/DnQgn05avuOrGXZ
         xUJFWSOkrzeuiYzVUet2eAQ2EsPejo5ZuSfH8NP6tHLuahB31bNTzRIFxvW1kagqjIYm
         QAqiYkZNUnqX4Wm+QPmjgSJYWo7yXl1xqyrN/nOiv2RnKIWjsQLzjt92Es9nzhGWELaj
         4DXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyXBNURe1RU+81suEB412FYbXwNsBRz9rjDW7EmTCDZlqkz6WiQQdeFusfCLHaiX3OYXkt8iyamjX/Hg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLC9Lq/Tc6do59QLTMYjtyr+t+U/UwbbpnnWLiP6pbGxEeVCF11
	F5wtOhxlJ7lFXD/fXjdVHZasSVjsU2ahAtYd+1OPgYPD6aCch+sHzAU5
X-Gm-Gg: AYBFou2R3PwG/vPMfKwvynU1eke51bZmYGQziEbzU5Pi/0kSRMQKOyS8/ujW7VGmX25
	i6+o80GkKr0Y0/cV71Sun9xwvlMRWlHlSjwnHP2mpeSAkS27ocaWkGW37xb8KjcPr/XWPP00Nmk
	ZpKhPLcNKM5pGSTkKGoXNffimb6AEcSUxd5PJl2D9umo1PlS/P5uRb88bIziL5ajU8gfau4Sg2+
	9sEYma7YUqNycowCxGy58UWc9bvxTv0N17HMCo/4NhZS6kNKCvD/wf94TztgEVMIJ6aUYPEJqKK
	y1S06nNtgbqYMxi9s60CwlTn/P5yFHXJkkyNTgrzNh00uaTryUWJn7NdQpEZTsoy2UpgmnALD4k
	u1bOS7+YzSIosFnr+t0LZ0efnT0iM8mNIU8KO0KqvGWBwRdutIrbrrK1G+fe5cXMGUDtUSS+Rra
	b4qYpS3nwrm26iSj57AhDvIajdUMpyrE2qZSVngDYWtTqXf6ATq2BqyN6xZKD9L9K7L5hvz9KZe
	5tI7pyikg1lUtM47LtG3hV/lATcqg70Lwi4XbJxnRtDpLMu2ElRXarIAGMG6ijhBzIYhV+MSNVu
	6+doGRp0kRsR1lCu2G9DGTeYG4I7N3hNOgzDDkfusdWT/9VQCTzYjnp41jqicF0TRmppBv6dJ44
	xzibIhdCoMrhimJGGw05Uyj/Wm0NxfRLhZ2Jc6fyvE1vOt9XnAP1w5ydt8h5KgCCoX0U=
X-Received: by 2002:a5d:5e8d:0:b0:487:b50:101c with SMTP id ffacd0b85a97d-48e5d567ec6mr4561241f8f.5.1793180663164;
        Wed, 28 Oct 2026 02:44:23 -0700 (PDT)
Received: from PC-Marco.lan ([151.59.117.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm27514349f8f.34.2026.10.28.02.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:44:21 -0700 (PDT)
From: Marco Ziliani <rylos78@gmail.com>
To: Simon Kruse <simon0x+git@proton.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chris Simpson <chris@nilk.net>,
	"D. Manresa" <dmanresa@gmail.com>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	Tony Garcia <tony@loafecho.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: i2c: ov5693: Fix mode changes, flips and autosuspend
Date: Wed, 28 Oct 2026 10:44:18 +0100
Message-ID: <20261028094418.13598-1-rylos78@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028082920.63853-1-simon0x+git@proton.me>
References: <20261028082920.63853-1-simon0x+git@proton.me>
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

Hi Simon,

On Wed, Oct 28, 2026 at 08:29:32AM +0000, Simon Kruse wrote:
> Unless anyone objects, I will rebase v2 of the conversion on top of
> your whole series rather than the other way around.

Thanks, that works for me. I'll post v2 with Dan's comments on patch 1
addressed (ov5693_mode_configure() moves out of ov5693_sensor_init()),
so please base the conversion on that one.

Regards,
Marco
