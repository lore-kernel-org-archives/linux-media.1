Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3443815E3
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857701; cv=none; b=ke2Lr049PzVWqnHe2fEcN6hBdKNwlXa+XbAp9VGrQNJCEBh+u25/zVn6eMXuveGyMvz1jPhZV9okDMWLGPt1e2k6PdEurIXmn7y2ZBCxKNdTHh/mSHlsKHyvBQD6xBDV8Mr4b16I+YzlPAMqD6QWUqgEmkUKNRCqvUwITzpkGqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857701; c=relaxed/simple;
	bh=H4Le8eUfPEeocN6zdps5oHnUAPhq5t/jTLqWjWm/Dr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qkgm6X2Dr8X2WWBdXC8W76wZd7nMMaDWECedqWljYcSQ0KNbCmu9gA6w/NdM0YTR/lAjSQpLDew5Z/ffV5uy4P2e73778A40f5hUaoMJll/2Q7eYffK1aTn3owqtxwgtI+ssZwW3pkaaaHuUtdlNPM3u1JYKpaQ6etID2LaDAuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcO3nYJW; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcO3nYJW"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c83acb86eso21946131fa.1
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 05:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857698; x=1784462498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FhaV76GWohZUqdyYEFqWpcN/yJOC7//M5Ylh0672MRY=;
        b=pcO3nYJWbfy0q7YwFaARGoo4mThRsqH0RqMeOfVKgIt3JNvkEQRYrOJ/VaDZ246bF+
         w4NBbC9YY/K2DBCrGXvIBvyNRsFpzaOMp9psZuIIVTcH2gkyqLpZ1Is7P3Q2D5efcWc+
         40+VWxy/cYLAdCvTD05IdQUHYiHwzsnZQ6TW8hfSczHZJQ7vrl/p7lk9qTzi3aDIQMN5
         JoG11ul3gVqyn8T62U1T7G4SykKZMByZL8EKbo+ksm9jKSQljrp5itp0HGz3SXxF+LAx
         IFfG1yunZ5QTJ69mVNGBg8CkkP6whiP9q3JTDc9HJ3qjL1m7SBgmlPcCgJKsKp3V2jNy
         R1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857698; x=1784462498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FhaV76GWohZUqdyYEFqWpcN/yJOC7//M5Ylh0672MRY=;
        b=E9KQSAg9pRojl2BAm0rG2Q7aC0eQRrTMLI8I33SB0ATWxZM/fGvfzyQFP0uDpK3/p7
         IhHThT3zgZrThaQXurVVVXarqZtE4ukUz5s+41uVvLzWPSZU/u6cne9F0pRn4gEJiE3i
         KR/bB7v92VezgZPpdU9huy/51/hrJ+7L2M0scL2p+pdakxw8/cud7fqzFSdGzexb12PY
         VVIOEuBbKHmqo8r3Ibwg3+UkgLe1HGmEFpGxN68qa8pkBjH4z5pIRS9uFl9cD9pZw6R5
         H4C7XtzNJM8FYdTyEVNooiUKG0oH+8XELYQYXUnEncg5Sxb0AAeQt+JTclSy7A4Iw9GA
         8WXQ==
X-Forwarded-Encrypted: i=1; AHgh+Roxe1YTLCpHMmzcXPMxpCh/BmF6LIos2/c4mlOshfskzSgAbRjVc3jP3OZlaCuZc3+36ZR80drg3OAF2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5rj5HWM9mXoilzZdB9FvadikTq4iXlcWagRbvDNECA7XmSLit
	O3+FZLvR/jlz/A1OLA2hl6/YDExin9TjzAex2Nt6VxTBEfZDoQQt0dbh
X-Gm-Gg: AfdE7cn8PIPS7n1FDDnwB4iZ98SFi1FAryYkutXNtf66/84NW8Dj16b4Ejj8H6pcRLr
	Y6338KztvTQrJ11mt/yKvtWmsjcwXi03iRs0p1zV5wWuTh3CU4UePccFPiMCWSV5AcI/LwHzM/4
	e53fXx3XfdjFDI0AykHCEDbYO5OFTwURRrGwuw9NJbb/foVwK8uTmTj7RJ1RwnWm3SkLOoHhNCL
	IJ11zksy4i0N2X0pTkTceux0F33h0BEJj0TNj4HjlpagjfMWbvvlEn9ODIitgeVWwAm+l10DkaY
	DjYZ9gNQph7n9+cXHMiA7uEkqy8ACwbNkqC9+CY79Y7EQhRWTfZrWFsOEiAOvW9xfAo3UD4EWUU
	cB+vHywJOuEMzSsd+dsCLO4n1UPPKMGoPgZnjP/psevmVDCJJrKljm1piHO+iwL2Qqri4bTrxN0
	8fDWVIYfQ=
X-Received: by 2002:a05:651c:1b04:b0:39a:e29b:78fc with SMTP id 38308e7fff4ca-39cae8db771mr10400911fa.40.1783857698298;
        Sun, 12 Jul 2026 05:01:38 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84ba1b9dsm21339001fa.35.2026.07.12.05.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:01:36 -0700 (PDT)
From: "A. Kalimov" <erqeon@gmail.com>
To: error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"A. Kalimov" <erqeon@gmail.com>
Subject: [PATCH v3 0/2] staging: media: atomisp: cleanups and style fixes
Date: Sun, 12 Jul 2026 15:59:23 +0400
Message-ID: <20260712115925.79047-1-erqeon@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a checkpatch warning regarding indentation and removes an
unnecessary return statement in atomisp_cmd.c.

Changes in v3:
- Added missing commit descriptions to pass Media CI checks and address Dan Carpenter's feedback.


A. Kalimov (2):
  staging: media: atomisp: remove unnecessary return statement
  staging: media: atomisp: fix function arguments indentation

 .../staging/media/atomisp/pci/atomisp_cmd.c    | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

-- 
2.53.0

