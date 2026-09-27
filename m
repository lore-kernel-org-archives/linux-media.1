Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CD63C1D63
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 22:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546790; cv=none; b=pyoXrBrUw4KVxpcLcf+cevHU1gV7EYDYEMhsEmrrrgmKcWQy/nO8OLnXvgu2ALQLJWuxSY1afFgzZ2lLmxJITx92ND4aNlD+z2sOcNbvpMTM79F64LqrCNaGwr4TRjSHNpiFANiCrehcE3M7UdRhdFrLvSAYcFYm9bwXnSWDmiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546790; c=relaxed/simple;
	bh=5zMxkl5qoDM8tk4xKszlW3nl/4Sd8tCv0cm3DMXhqUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCzjFdu5BuFreMirByw9kmeghrSnNJC2r6Tz5WLvp9y3KxUDDAKd8/pOANgpWZuvQpcQCjHjEeIo4qaDPw0klYGMvWj2uDd9OBpCDGBYD++fv49vwzUKCRXUJTG4THSUHpczF+/LJkRLg242FVLjQ2WKPZ++5rR9ogTydOlK6zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEF3TCLY; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEF3TCLY"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8a88d23a5a4so19767347b3.1
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 15:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546787; x=1791151587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7d1QPvHoe0OYjIP5fGv8TGSJAJOD/Qga/OWoQgh/Rc=;
        b=oEF3TCLYLbbmeDeItJ4FwENkALHNF3gmbid1KkLa8Up0eZtGxNlOx5jUolAh8Ng+nD
         frLzWiI67sn9GLF3A05W3ljeDNxCdO9f81PPhrkcmJWZQZW67/yT2qCrHPkHaOaMXxKg
         LeiAiX/9m0obiI5uxHjW7YoT1MDqjIfOcg9xWO0K+f6LQdcvR8DQg4eB+GoZIZGtzL2B
         nyFEAwy1ZK0AkCm3BEfznXB1LXaARBSCcv/vi+Zu8fPevFr6jdWQs+DRkpaDj+pMVu3i
         HQtl4CFRWSeZxOs1mMYrdNjkfchFtqXt84k9zVd8Fp3aJWc++n700vCM0LxYppPg8hJ2
         cj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546787; x=1791151587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h7d1QPvHoe0OYjIP5fGv8TGSJAJOD/Qga/OWoQgh/Rc=;
        b=WvmripIHZAgHCkObUgrO056InAD9RnEVyEpkkgrYGjoILdpIytsrX1Ow8mG6sCLZFc
         AOWugRv8zqMk6hChNrPBqhm8aZGyMZHxSyQLGTeuYI4EHDnJv3TTky3GEtS6LxrC5EtB
         OL85egHOd1DdMhsTZBhMVky4be8JSlwhjQ1SOB5bo/ahXrtYK4K94h3lwugoZmd4NEkt
         Y3G9YUwmU9W4l2LnEv2WL09WlDQEHR8sdnG7yJVLf68QfsdsrKA67tY79oFrznZ3OooB
         66abS8oWp568rr04FwWozOcrVuseTov1jXjVRrSnIuG4kmFY/r0SEwfVx5Sf4p/3NWiE
         6lig==
X-Forwarded-Encrypted: i=1; AKwUvBxsKXflFE/R1TUTXyNa1r8dRPwi4g0tFpLhEDybRl6pH5IlwxVIQqesFz8ZP8sYUkWIi5fbksRVapjOYQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLRC/dFtcrkK+m3KvDVIs3t58mk8AV7BoWlRBKyZ+xXPm5qbJ12
	FeDLHUmgQPXbWpzowpW1cz4DiRi0E6GOHuF89ghBuMwghEkkg0szZ4Ct
X-Gm-Gg: AYBFou3wEAc5LG8jbR8B/K7BHzbienksp+wmDGIcHcCvdfAtHu/Aea7BA5pcEwGY1GO
	oPnBGlmu3snwr9BRNSxBpgVaemw6zQB6qLS8MaQaAJdiKg3ypl9LkFlQW45oQi/uTyx9jEaPHF7
	dWriOz5jNTPwkzMYvBpuUgo56WyDNpGarHF05rMk3SLZBcJaOkDZM6jsu/wImAV04elHkvffINj
	fq3gUWDYQqAHQGPmse2rG/j335Xq2F2OHgCvtOZqL6mX/F8Lha+qaABfkwM+gIq3ryceU1Y8O5r
	VZVgrlZ0qMJy6YBQW/jQVVmHfjZ5TjNFeZnXHxZeMnnA4vmYUj29SgHfY1ZGM6lsUHvV6rEdq8k
	fD2mpaLN8z3V0iAmTniOEQYN4yvDqyiVAHcSo63xHiC/ZjYUlAqgnLHf8f8a9ns528JReP4vTCk
	79ZIOG00NVCqwLA370jt4ItSMaIhwgDj1PgSu/4YtZc/SaAmJq6PcyWjsiBkf0WmFcCJVB1NRp7
	NOXnoSgCM9fUDAnv6SJrzvbB+zM4FpmjjItjahkFF+z4bcMUspwJw==
X-Received: by 2002:a05:690e:1689:b0:675:3585:243a with SMTP id 956f58d0204a3-67535852855mr1111549d50.3.1790546787526;
        Sun, 27 Sep 2026 15:06:27 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6740efc941csm3634057d50.20.2026.09.27.15.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 15:06:26 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
Date: Sun, 27 Sep 2026 18:06:24 -0400
Message-ID: <20260927220625.629672-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCvBkMDS9eSRRVoMqQT41c2uq+MQtUFHPm0gGuv13FWevQ@mail.gmail.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com> <20260902002553.34839-4-jordan.mymail@gmail.com> <CANiDSCvBkMDS9eSRRVoMqQT41c2uq+MQtUFHPm0gGuv13FWevQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ricardo,

On Wed, 2 Sep 2026 08:34:34 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks for the reviews on v2.

I have a question about how to handle a second device. I now have an
OBSBOT Tail 2 (3564:fefc) and it has the same defect as the Tiny 2.

Its GET_INFO bytes match the Tiny 2 control for control:

  CT_PANTILT_ABSOLUTE   0x03
  CT_PANTILT_RELATIVE   0x03
  CT_ZOOM_ABSOLUTE      0x03
  CT_ZOOM_RELATIVE      0x0f
  CT_ROLL_ABSOLUTE      0x01

Without a fixup entry, pan_absolute reads back the commanded target the
moment it is written. With entries for 3564:fefc on top of v2, all three
controls report the live value on GET_CUR, both during a commanded move
and when the camera changes them on its own:

- pan/tilt position and pan/tilt speed follow the gimbal under the
  camera's subject tracking, with the host issuing no requests;
- zoom follows a zoom change made at the camera.

I checked the other AUTO_UPDATE controls the same way as for the Tiny 2.
White balance and focus only echo the last SET_CUR. Exposure time reports
live values until the host writes a manual exposure once, and from then
on echoes that value, across a power cycle. I would leave all of those
alone, as on the Tiny 2.

So the change is three more table entries, identical to the Tiny 2 ones
apart from the product ID. v2 still applies cleanly to media/next as of
2dcdfb625c3b, so nothing else forces a respin.

Which would you prefer?

 a) a v3 with the Tail 2 entries folded into 3/3;
 b) a v3 with the Tail 2 entries as a new 4/4, leaving 1-3 as reviewed;
 c) leave v2 as it is, and send the Tail 2 entries as a follow-up patch
    once v2 is applied.

I lean towards (c), so that a reviewed series is not disturbed, but I am
happy to do whichever is easiest for you and Laurent. In any of the three
I will include the Tail 2 lsusb -v output.

Thanks,
Michael
