Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CDD37F333
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325860; cv=none; b=cOb3TeXPkqAyRFYWt6n6ul+H9Iigw/wH99LBq04f1eZ469+dkLjCS91NQk7mRjMsDKyKClGD85ej8V26DLSgimrtdc14g23TtX/VfT8p/Aghyg+JMHzIal+lncXUU/DWihDQVhSQV34Y84XTogFTBAVN4qw+JVPi1HoYywNkHqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325860; c=relaxed/simple;
	bh=68O0FQeFcLYObOsVAesouF128ugeFj7KwszTm5g4siM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bzVb52iEyIdUtFdXMzLv0AGHEEZfW0kAkUK9V87LmFJQUFoy+b3lSnejASnhyMHDseYjBHZIBKji6Rkwzw88SvfKf1ZUAQhl9RJnPgzuh/4v5divo6fmJevA+ZMIEljFReTXbtepukGPQ8FW5nkNjdzH5R3zofq/iuHoNuPedNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tA6V54YR; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tA6V54YR"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso503934f8f.0
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 11:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789325857; x=1789930657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=68O0FQeFcLYObOsVAesouF128ugeFj7KwszTm5g4siM=;
        b=tA6V54YRvDPjDI5f4oOMV9t1VxGJX0GMKcESBt7lil9c6lIb2628TGehmug22ZLQfy
         u4Ox5CPWsj5bqr0BSRopiEJbsJwEhDu/N65jprqU2ecaZvlVCGdciSp1hicTcVLe4/iT
         cvTzjgP4L36uSMUHw9uu/4EhrtYxYaNmWSNhKiRZXCtpMPH61rUzlO9CUxXJo7EGWIs+
         XUdfiS4o5Ln4tyw3uRelV8F2D/WaVYSfzMIBxqIoN27RSJNTmKbjrKP6j5CbEHBtpQhZ
         w4GJtHV8zYjwpGghONb3++aDW5wwuo/fVtmcnhNbPlAUDTxKEBToYQIuiA4dez6LtjaI
         CTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325857; x=1789930657;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=68O0FQeFcLYObOsVAesouF128ugeFj7KwszTm5g4siM=;
        b=r6B+FkXhuG4W7+GSyLFu4Tp53j3DmDWx5C5DtKd5NREgWuTGDpXkKbmLJQvVZprjcz
         gxVVJD4/zrvpRQBtf3QZ1EEcCeqOQBZehvD8qaWwHb18AUaW7iHk7mMjtmPGLPXxjC8f
         0BE9Ctm7Dk+ovSdPHGu1uMbyZepYfMTzt3KHAkAxpokgthqkFUD6nmdeFLxgNqOvtGkK
         SBqN55SRqL0188CZ5ojXxUAEyMWxrQ37thK40Kj08uJ30EheYg3eGI28tWA9pQqxxNu2
         ViWXdP5EuXjVD+6iTRxwP0KjyutSCzeSWP3pShmQtoM3IpUrrrxz69iduT6CvDoAL2Tn
         wXTw==
X-Forwarded-Encrypted: i=1; AKwUvBx+GCYVCtFkJETjAPDlLNFizJOM+yZbV7mXPFV5jgP91DL6f0QbQeVk1nzWdI/d9mc+jy7knne5p8OLdQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kfJL1GIdFXbt1hdMyswgO7nnNSR/zerV8jmSrJml0opLIpK2sV
	DmGCOaDKQFYXPVA8V56uVH0bI9qp5aJiBu0qU0/+nVa3ObjsVWMt1hFs
X-Gm-Gg: AYBFou3Q/d3UMU9E09JWDIUSzGkBaIdVjLxH/vao0nE7MQTC6pqkCQjfr9/u46rgtiY
	Yn0Vf05F4uthqIryL7nV1dLuXIOmBBzNgippoVfaZL8XblU5+IGqP8PXj2TqDzUOc9F0lEdQ+mg
	DRXIgD7PV4KFyAlQcVDUFh3tyF5/kWO6IWw2k5qfif6TAP98tE9Xq4CpXzu565DmsPytbUvaP/E
	OXQ1ilg70gPnce7usVYEfxwPzofsWPxIgM6BpNyk3XDGY2GvXs0w8YpBOpJZwvFYBUP+NsFTw1t
	Iwae6I8MX5d53ajN/FzShKe/EHHYyGu+Okoa9N3L9XJI4BWVIZDt3nK9mzNWID7ZMwp43NRa8xM
	B20tmawwXE181vVLbEkNEzxG/PZcTc7KaOlEvkQCrGr/9Vz61Ghzm2Szh7ORS86oVclv2rJZwLH
	ZwS9cb+dcoycNybhO1fd/a9z5pud2L6s6/T+WNzrlPlHzdKdbC/0rpukHzOcYZIUIy7sz3j/sJr
	SIeZPRLfeXwsz5GMG1ryDwA2n7UNq4aO1Sak/qElkNt+inqr/j/9Q==
X-Received: by 2002:a05:600c:190b:b0:49e:69e3:8853 with SMTP id 5b1f17b1804b1-49e6ca8fd23mr80296885e9.6.1789325856483;
        Sun, 13 Sep 2026 11:57:36 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e636f7fa2sm250776215e9.15.2026.09.13.11.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:57:36 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: dan.scally@ideasonboard.com,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: More details for Test [PATCH] media: ipu-bridge: the Surface Pro 11 rear sensor is mounted upside down
Date: Sun, 13 Sep 2026 20:57:23 +0200
Message-ID: <20260913185735.6607-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913172332.85174-1-lsa.uz@pm.me>
References: <20260913172332.85174-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The image is correctly flipped in Gnome and Firefox (the two i originally tested on) but in my original test i forgot qcam in which the image was not flipped ¿maybe it only flips Snapshot and Firefox because they use pipewire?

The preview in the three apps was fluent and the image saved corresponded to the image shown (rigth orientation for Snapshot, wrong for qcam)
