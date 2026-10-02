Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C90D3DDB0E
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944870; cv=none; b=PR4JuuSScdenOEdCvBAefuvoHeyuqH4I0YH1e6+xt2Akj/I07Yg/EI/iLhtaMh6syBjU7Zs7Zjr8yip9eTJSZMDLFJGou3Os4omd9ZsXX751DbX8bY8s2uPRlzcn2atFbd4E0PaE9ComBk3x+4EWs4GypCLOu/Lz5AlkjEp3FGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944870; c=relaxed/simple;
	bh=WquY7HvTUY1YNIuKfLmkwIUcPE6j7wZaFxlIYZ0OU8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Io/HxM0CshiwEu/UxSL++Tz44FUU+8DIPvwq/qhrEMcqheGb13x/Fn7FOnCCZ34cH/hHZHiI0cnSl3q2uy2KOwaLRJNn3k4HlyV3nFxiXbW/WGntADCBmt7YgDti/bOnjPKw10aFqEifcC1AUydPTrDwy9vvZcB+rpENMaQZfUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfdJYP0n; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfdJYP0n"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67583c777abso1347566d50.1
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 05:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790944867; x=1791549667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WquY7HvTUY1YNIuKfLmkwIUcPE6j7wZaFxlIYZ0OU8M=;
        b=WfdJYP0nApmRzmSmN8GPWxaEFKUe9P9FQkMQv/pr9N0DYrqoOIAgreOR/Gv/NXPtXt
         2/O+hLKEbjbkBglaeGhsyCgOsxqF/Cffy5MbAjXbMiEGtl033Oey/SC9tgX0EPTa6dxS
         me7BMeD5/ABKvSjrSsCCxEQpUvo2fFY0DlYfnYZHnsnfPBUAKPoVYtAjYC3o3gQk/O3h
         ryUndDoemkbuxCSI0a3IBfWCWEPQD+jov01QuvqnzTWcxajb++txJAPeHDyhYEdsdg7O
         L4NdvtL1P0MzBOjhSGQbahzMClrwEF9RenFYqhvfLT/2vho11ttkdRkfQEgTATvTsjQO
         Omww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790944867; x=1791549667;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WquY7HvTUY1YNIuKfLmkwIUcPE6j7wZaFxlIYZ0OU8M=;
        b=qZ8VwURIgPujZj9onugW2/V9S56vL4oWYY2EUPJxgOycCz84BTQppOrX05Jzap2Tcw
         ywcjdNJgAp8ML8QAwVf05Svm44Swu+nTPtxfmeQdIPOJOM9kZhl2r0GFfQngCCdY4Wao
         iZ/hYSLEiLWvgXoBEErL4qOG0nTNrl/6eGpgTrSd9QnMOVQZBRbBE0bT63DeVdx6IkeF
         xDGaWjjl+49e72g7Opi9S/knY/IXGSQdenf94qFKA6tbgikyOMrO6yg5+7C02eKJmyet
         4eqQ1sPFQ3jIxx6WG5BfukMYx17PORs1nsX/w9+5lQw0ecVRZk3rLcBOc6bvsZAymh6a
         wiZA==
X-Forwarded-Encrypted: i=1; AKwUvBzgQyo6zM3foQ1zgYQttNU/9Od3Kez7Chc89qGBOoF+OaqgndPa1tYFGsK079932a/zMz/P+Y7eZedrIw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKx4fwzfzmxiwVKazZ0f0oMLv/rdMDYHfHrYxkr83hcTMSbDsZe
	wy9OcPIQ+qu1fr5ppY+6nwCXX/TjkBO/pN99/pXx7GpZhZiNg7bNNm5J
X-Gm-Gg: AYBFou3eNsVukTkMF7e9dDP/YWFODOhMT0lhz+Gu0j6KSkOCl9aewyFPMH0vXFIYjyV
	YLMDC0Zhgck6yYFnP+FIheQLUeO/Uml6UlbLNIs1CGjZj6d3i6V0zZLVdC6XrVbauZiUxOpWG7c
	miM8fnnSix5851WwIReJ9TADVZWmBDI7ahmXkDt4+qzEUmlQrtTD99fcNeOxlWlaXQvrCr4lsCW
	PZyv3OiUOdsCx+Djlx6o2PgmYDPGryTbEDac/Z2ATkKRO0itymU16TQRd4tJ4T133JKglYi0ObF
	zDhzbg1pcCWgv2SomTysx7tcC1m8zsY2fsQQx9/7uK6GVaHsG8MtdXirtOCZxNnMtvUlA4PRTVe
	Iq8BCv6W/M0yb4buzBGgJjjqwflj4i9KGMBnJfqUOjhCb61YhSM25/18GE08+2EMooskB+oRJ5h
	4o3hYcYYEiidxTUCaNFW/botBv4iGuEX6lg0ot7jfagBsYfJ6AeKI6A9uTsTk/oWXBTMddlhN45
	0qSVN4jFbc3LeDcposKmACpfG5rTN0OyYrrUQosYcjiXcMvwaM=
X-Received: by 2002:a05:690e:4344:b0:674:20c8:5af5 with SMTP id 956f58d0204a3-6769119554dmr1834462d50.27.1790944867295;
        Fri, 02 Oct 2026 05:41:07 -0700 (PDT)
Received: from llmbox ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677ac3ba68bsm875023d50.1.2026.10.02.05.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:41:06 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] media: uvcvideo: report AUTO_UPDATE controls as volatile
Date: Fri,  2 Oct 2026 08:41:05 -0400
Message-ID: <20261002124105.55173-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <60efdb3c-e669-403d-b2d5-fee993e16217@kernel.org>
References: <20260928215021.819064-1-jordan.mymail@gmail.com> <20260928215021.819064-2-jordan.mymail@gmail.com> <20260929123422.GA349401@killaraus.ideasonboard.com> <60efdb3c-e669-403d-b2d5-fee993e16217@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Hans,

Thanks for pointing me to `v4l2_ctrl_auto_cluster()`. I’m trying to
understand how to apply that model correctly here.

From UVC 1.5 §4.1.2, Table 4-3, I understand that GET_INFO distinguishes
“Disabled due to automatic mode” (D2, a state bit) from “Autoupdate
Control” (D3, a capability bit). That helps me understand why AUTO_UPDATE
alone should not determine the flags for controls with an auto/manual
master.

The Tiny 2 and Tail 2 pan/tilt case is what I’m unsure about. These are
the only cameras I have available to test. On both, writing the V4L2
pan/tilt controls sends a target position to the camera. With the
AUTO_UPDATE fixups applied, subsequent V4L2 reads retrieve values from
the camera that follow its movement towards that target, rather than
immediately returning the commanded target. I observed this with tracking
disabled as well. The pan/tilt mappings in uvcvideo have no `master_id`.

This is what I observed on these devices; I’m not assuming the
specification requires live position feedback. In particular,
§4.2.2.1.14 describes pan/tilt “settings,” and both cameras advertise
UVC 1.00.

Would the appropriate approach be to follow the mode-dependent flag
handling you described for controls with an auto/manual master, and use
`VOLATILE | EXECUTE_ON_WRITE` for writable PTZ controls exhibiting this
behavior? Or am I misunderstanding how that read/write behavior should
be represented in V4L2?

The v5 I sent fixes the event-notification issue but retains the blanket
flag mapping, so your feedback still applies.

Thanks for helping me understand this.

Michael
