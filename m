Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F1533509E
	for <linux-media@vger.kernel.org>; Sat,  7 Mar 2026 20:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772913984; cv=none; b=ao0S7eIPxFeT2jH3T/pBa+xyAYzlTR1DzoIX3yzNgzMTBDLQw0AU9aH8gNgtN/QSE51VDfvB/oTVbSdcVsj4coDJP2NBpQwWxtaUpNO8i+xh0SJ4ViiD1sh/uqYQfJati/XMxHgRiqV0J4VcgmMaWkMZxFouR2aH8Mz8zwzhlIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772913984; c=relaxed/simple;
	bh=8kUxHJ638hHSUL4aq3eDzh0I6G7F42gV+Hk2A5ulRas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f5EM103nt8LIWkl/zmwTueQLI75C3hhU8Q8x1Uhc3trepSnL2alQe8f55NqInpsC49TG+FTqRJZqEbGdqQWvhG4PW2PU5IxavJmUXXFOkb/oN5V8GSHPJMpqMMh26zE5+0S+01bhvw0/Ulc7cnj3xXkemWVeUmU9yaOw3TCkt+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgixRFml; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgixRFml"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852a8482fcso11758395e9.3
        for <linux-media@vger.kernel.org>; Sat, 07 Mar 2026 12:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772913982; x=1773518782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnrXVEvsPXnnoulSxseecutoQNFZ6jX6C+2OFAUA6YU=;
        b=hgixRFmldsHcdMrBD1pI0c+jXOkCXE9akG5Lvo8qbX7HnLM23A4ky8DwWc7P0vEbMB
         aJ36MTr/Ji054AaMPhmseSzaKOESSZ9GP2ucX6G1bqqWpOM4LZuGYA9SZMu8pZXozu26
         X9z/5fPW5MW20vSyjn8mTWz0tXiqhnRe0+KOw1mRkNOr3gxXgyPAnuZFWmsUMG+pOYxY
         3e9Px+8IVC/n9cGVeoYjj3CTQ9M1gKuIkD9pMw67C6N2LLBM3CVJJKQNvXS0NSN2mhHK
         Mc4sgZMiA6ec4/QjKDw9xDJoiXbocNOsRimebUXuUgUbwJY53cquGgaLZro4RhmFFOmq
         8z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772913982; x=1773518782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NnrXVEvsPXnnoulSxseecutoQNFZ6jX6C+2OFAUA6YU=;
        b=SQzK6XAndctE9fNVrMKNTRIB5zBNpF6JOZ026nNAjhAyO3i6/dLFF30qmOOKG4HAXq
         437KeixcN0wr/JrrqHmxo5L4aXX9DDD3U1icYdh26V7qFo/fuguG68C4Pd909V9nM5ts
         3xz0AAplKHjIP6/sNFxsRllNEy/v+hOBRnHa9NsQorvXDEQAY4eUxmWBq8f7zzQ0/e0X
         TLd9g8a2q+C+IAWM76UWt87n6erIcG3LG5b2HN17MkoxjVG25yDHTOk+9PaV1SibJBDd
         HBl4v9sHVbxUsmw8yNvpmgr/r+RTAzS2VQGpWkXIMhFF9QeuxXMq7FrOHE5Jli8M1hJP
         N68w==
X-Gm-Message-State: AOJu0YzaJq/HwV+oximYrZE/lSmkPkE9uOf55sAeuNFmGJcJxDW7ep7H
	rqaPc808PNxZOW0Sbq+1/rkZh//Q3m+pjz9Q9GArW5QhCc2i+DlMy86p
X-Gm-Gg: ATEYQzw9uBlVPmSP9yxuf2WHP1gcwRoSEB33vMTM2MfVJ1nIbj1jbVTqCH/HiuK5Zfs
	UVH8BzeCmxXdnnNKtrq6FIsKKjXPz2LCeQoVEa47DAeJTqWE3aBDReEbCWnebucHTSO3yNS9prx
	3kdAkNHiKrCEMtZecRZZZaNwi7RonyzXcbKua1BLsXvi5+eE83Gie8yzCZtjSY4jl8cxjf58VnA
	rsREAxmu0PNcVSS1ApDtexLjZrucT2U+Fdno7H/1Hr/KJZv1HVkIT+g59a1uU2a3Szy93FnpkI9
	DMp1LRpnox/b3ZiK4gExpAlBZZJsgBQXmVGWful2GE0B1mDbsmdKylfUpy8Ptrsl/YZI9HEIN8S
	jqllRXaKUQrP8x3j7c+lhbzOflmP8XByXnhK3VX3jDkFtYOr2s/zgWeL9u0s1B4FAWK5PPpwoAC
	/NqaDUvFuo3Y2Amp4B/xIpSBflGnAIu870O3GKGJ6M
X-Received: by 2002:a05:600c:8718:b0:483:96d8:9f75 with SMTP id 5b1f17b1804b1-48526967aacmr108364805e9.28.1772913981588;
        Sat, 07 Mar 2026 12:06:21 -0800 (PST)
Received: from localhost.localdomain ([102.164.100.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485246ed174sm70723845e9.5.2026.03.07.12.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 12:06:21 -0800 (PST)
From: David Dull <monderasdor@gmail.com>
To: jai.luthra@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	David Dull <monderasdor@gmail.com>
Subject: Re: [PATCH v2 06/10] media: Replace void * with video_device_state * in all driver ioctl implementations
Date: Sat,  7 Mar 2026 22:06:03 +0200
Message-ID: <20260307200603.401-1-monderasdor@gmail.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250919-vdev-state-v2-6-b2c42426965c@ideasonboard.com>
References: <20250919-vdev-state-v2-6-b2c42426965c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jai,=0D
=0D
This patch is too large to be reasonably reviewable in its current form.=0D
=0D
The stated change is conceptually simple: replace the opaque `void *priv`=0D
argument with `struct video_device_state *state` in V4L2 ioctl=0D
implementations. However, this single patch touches hundreds of files=0D
across drivers, helpers, framework code, staging code, and public=0D
headers. That makes it extremely difficult to validate correctness,=0D
spot exceptions, and reason about regressions from mailing list review=0D
alone.=0D
=0D
A few issues stand out:=0D
=0D
1. Patch granularity=0D
=0D
   This should not be one monolithic patch. At minimum it should be=0D
   split into:=0D
=0D
   - core/framework changes=0D
   - helper conversions=0D
   - driver conversions by subsystem or directory class=0D
   - staging/test-driver conversions separately=0D
=0D
   Right now the size alone makes meaningful review and bisection much=0D
   worse than it needs to be.=0D
=0D
2. Mechanical conversion claim vs. manual exceptions=0D
=0D
   The changelog says most changes were automated with Coccinelle,=0D
   while function signature updates in headers and edge cases were=0D
   handled manually. That is exactly why this needs splitting.=0D
   Mechanical treewide conversions are one thing; manual edge-case=0D
   handling is where subtle semantic mistakes tend to hide.=0D
=0D
3. API conversion proof is missing=0D
=0D
   If this is primarily a scripted transformation, the review should=0D
   center on the semantic patch and on proving there are no remaining=0D
   mismatches.=0D
=0D
   Please include:=0D
=0D
   - the Coccinelle script as a separate patch or in the cover letter=0D
   - a summary of what could not be converted automatically=0D
   - a treewide grep result showing there are no remaining ioctl=0D
     prototypes using `void *priv` where=0D
     `struct video_device_state *state` is now required=0D
=0D
4. Conversion consistency=0D
=0D
   Several call sites now rename the parameter to `state` but continue=0D
   to use it only as a positional placeholder, which is fine=0D
   mechanically, but the patch should avoid mixing semantic conversion=0D
   with opportunistic cleanup. Formatting-only churn and spacing=0D
   adjustments should be kept to the minimum necessary for the=0D
   signature change.=0D
=0D
5. Risk concentration=0D
=0D
   This patch touches both framework headers and many driver=0D
   implementations in the same changeset. That amplifies the blast=0D
   radius of any mistake and makes it harder to tell whether a=0D
   reported regression belongs to the API change itself or to one of=0D
   the driver-side edits.=0D
=0D
6. Reviewability for maintainers=0D
=0D
   The CC list spans a large number of maintainers and mailing lists.=0D
   That is appropriate for notification, but not a substitute for=0D
   reviewable patch structure. Individual maintainers should not have=0D
   to sift through a large treewide refactor to find the parts that=0D
   affect their drivers.=0D
=0D
Please respin this as a structured series with the mechanical=0D
transformation isolated from the framework changes and with a clear=0D
accounting of manual fixups and exceptions.=0D
=0D
As it stands, I do not think this patch is reviewable in one piece.=0D
=0D
