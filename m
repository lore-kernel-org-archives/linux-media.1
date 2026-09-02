Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCAF4A8A13
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361157; cv=none; b=uMad2a63AqXbdo9UjdusZoca7/3+de+hUDZfyBto+fY8ZAqkW7jTjE+guN/wnSSsaZARklig6N6v5cqTLtRD3Nquul3XuifICLtzfkOn206vZeiVOug3J/+wto3/pn1yqKPkBcG+Fk1fS/17MAJBORD/uNRUhc9dgyb1R8VRFRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361157; c=relaxed/simple;
	bh=ELrGD0miyJLias5seN/+vG0DXMBNmip19woOIuaGtG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gF82ezYJsNqx6rSGL2+Y46wwSKix+6ijRbL9GrUQhfApQKN4NsP2wRRWin5rN9LlKo95dEFUcttxQ6ISQY3ALa69SAzXt0lPSHb3mNJfOr++T7T7QClo7Wt/IY5PhHjVzMHFjALz1Sy+A1vQdVbQpWCutYnlcxYfHdjV/PHONTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/AQ0PwR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/AQ0PwR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso8093845e9.2
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788361143; x=1788965943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgs80PN+o6P1wEZ/3GKLDW9lDIEmnf6LbdiE+ajUdKY=;
        b=G/AQ0PwR1ZsIsag2VABoG8Mb8t4izSeSn1ZQ7F0kuuMjuh9EibpBtXUjME693CRyNT
         r5dP0zHv4EizzK9zzMumwXcqUGhGLCiaAbsqAQ1zNvwnNtRfytEyLbkhX6kjiflsRFcN
         B9dN7f4qtIGol4lC+ut2s6aAiNAyq4PVHvHEWvIIXlpHKwWdzbBNnFSbVmuYunrQmYBg
         TJjb8tP47GdfBHhy+5vTjsjFB1/dykywnaL/10hg+5JtUsqr1YvtEyix4syosxYkboN7
         yW37tiOU8trvC/O+BGMAWDuNSj0Gpq36Hl4SoZ+h+vPDMe5DXG/ToFNVZG5o5PxflAon
         kdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361143; x=1788965943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgs80PN+o6P1wEZ/3GKLDW9lDIEmnf6LbdiE+ajUdKY=;
        b=fUAyIiwLwt9+HSW6qJ4cr79xmkGbdIVuD2eGUqA5PU9gF19+3heecdDiRcq8U0aEz8
         tJIHJirFBQPufPWDonKKVRO92Lzi1b+hYUowM9S5uwE5EMOzorokEl4il9X9YQELTzj4
         UISHtLTZkfzjjkjnvJ6T3aI//mBEUAFW8tcXgkwSK8O7HLJGItxf+Qz7fGSbDPHkTIyN
         Eif4QH5gJLfpp0ac/736/7PFZZUsH633vuZ9act1OK5KUyznPW+XUFGv3dX0vaZTi/+O
         ctHpzqjKO7NWWHBzY/0GaSf0d8kMyKCr+XdPHQfkPEpwuekOOyJQr1YpJoohm9HBLsbQ
         I/Ug==
X-Forwarded-Encrypted: i=1; AHgh+RohhcOAi0aLFxEXojLDW8xVDVG2ZT+oLa3PUbZXUG1/k+QHTtIYSBq/PUzgsa2Mm7Jx8pd462tUSookzw==@vger.kernel.org
X-Gm-Message-State: AFuF++kpFUr9/VunT/yjwz0074x3fT1YppkHicJTgyIolNUiDG541HND
	Bo480uMgEh8H3Hbbi6WBqLR2XDQ8CTDRQLkBM5DgrwF7ljZqspZ9JOw=
X-Gm-Gg: AR+sD13lDG6TaKx0VuUUisfhaeQzn0i6yxAHl7qcWmvo3unLvNVH7sIubpoDBrNuJ5u
	qhHxZ70IU0d+2frVxHGOheRh3fA9fHOmB479a0Z5xrYy7Hg9AR6EcsewsjgtcHusiBgNqQ2yNcw
	TukG7de6xuy7VmGXsEKeSvw+KnoHX2fgdrFpv++6F8TbcBrzcaQkPwn/H9NObPKCjEiLjXUy7fn
	IPI0OkrzCKV5HgM/zzh+Mazi6D9qpekev7k3X/x8VlTTxVC334piTMdCJc/Zr8dASH1qM6309Ew
	qQKXJhZIzOnhvaReRT9RE2kBHUPD/E+oWikfikrkg5dmL/7dh1Nem6+cjehxc1LBsQiNw6tEcES
	s7p2ylZ40pZKOw10Ogz8bbEO95KAyvC0Ekv//6U6WJ8bcON5Nl9/OMKfD8/vKTp5AY8VUtq2aA5
	oa8UEavkoxqLim0mI3Omvh7gQ38aTIsTaKtDK/eW91328LT7/OjU7gHhtUHUp1Vr5SrPUuSumGT
	Q02cBTueHwoCwl4GRy48u5Z5eR9wLol155dvRMyENVzKkm6HPWZf0FEafx+K46LPxYo7qiq
X-Received: by 2002:a05:600c:1385:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49ce583e8c8mr91203115e9.9.1788361143256;
        Wed, 02 Sep 2026 07:59:03 -0700 (PDT)
Received: from chateau ([194.65.85.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0b425sm154191255e9.1.2026.09.02.07.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:59:02 -0700 (PDT)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Miguel Vadillo <miguel.vadillo@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: do not use the CVS device lookup for IVSC
Date: Wed,  2 Sep 2026 15:57:25 +0100
Message-ID: <20260902145830.1796405-1-gvozdoder@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <apfI7m2oD-k5GOYN@kekkonen.localdomain>
References: <20260901194526.6369-1-gvozdoder@gmail.com> <20260901195036.7648-1-gvozdoder@gmail.com> <apfI7m2oD-k5GOYN@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sakari Ailus wrote:
> I can confirm there's indeed an issue here. But considering the list
> contains the CVS device HIDs, doesn't it mean you're returning NULL here
> for CVS, i.e. not for IVSC?

acpi_match_device_ids() returns 0 on a match, not a boolean:

  int acpi_match_device_ids(struct acpi_device *device,
                            const struct acpi_device_id *ids)
  {
        return __acpi_match_device(device, ids, NULL, NULL, NULL) ?
               0 : -ENOENT;
  }

so the bare "if (acpi_match_device_ids(adev, cvs_acpi_ids))" is true when
adev is *not* in the list, which is the IVSC case. Both spellings are in
tree, e.g. drivers/acpi/scan.c:1800 uses the negated form for "matched"
and drivers/acpi/x86/utils.c:206 the bare one for "did not match".

On this machine adev is INTC10CF, which is not in cvs_acpi_ids[], so the
early return is taken, the IPU6 probe fails with -ENODEV and is retried
once the IVSC device exists. With the polarity you read, IVSC would fall
through to the lookup that returns the driverless INTC10CF:00 platform
device and the camera would stay dead. It does come up, so the code
behaves as the changelog describes.

That said, you had to stop and ask, which says enough about how it reads.
v2 wraps the match in a named helper so the polarity is visible at the
call site:

  static bool ipu_bridge_is_cvs_dev(struct acpi_device *adev)
  {
          return !acpi_match_device_ids(adev, cvs_acpi_ids);
  }

  if (!ipu_bridge_is_cvs_dev(adev))
          return NULL;

No functional change, so I rebuilt it but did not boot it again; the
functional test in v1 stands:

  https://lore.kernel.org/linux-media/20260902145440.1786297-1-gvozdoder@gmail.com/

Thanks for the quick review.
