Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87604DEC26
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606103; cv=none; b=oq1R4SdYG4C6LmEUF565PkbaJaydkgj8ot0+pPbuQhr0Vph1wpUJpuxo4xhlP+eGHmqtkeqn2INKfpoaNaP2TcPjAYQo3MN2Dr/PlsFd6SZqQnHzBvZBJdeXaGrOoHducsu4U+h0vTL0ibtOrp2UrNNnYQiHHQJnWgENXPlH2Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606103; c=relaxed/simple;
	bh=btxyB/WLVckW2FMnL9chr+o0X+NcLEk/lDCNp3gdG18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcsAeh/2oAUP1eWECVZJiaAh3s7+tEE7shMjdbw88g4sxDayA0wRLSTkBRu0sMFUcEZHFunhDXLRWl48a2ViFXjIiV21uGwy16mCKxjxoHgihylMmZ7FlYU8uHKoAAJoU359fBu8WfcomXNNHqPUqwzPG7I6rVbtHpO6i4ROd9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYTZ52o8; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYTZ52o8"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6730c3bdb35so1918653d50.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790606090; x=1791210890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btxyB/WLVckW2FMnL9chr+o0X+NcLEk/lDCNp3gdG18=;
        b=VYTZ52o8AeC5jdJBK4QvmB6nZJLiz3H9J1E8O5C6Ofua450fRG5tuspTappes8IkL3
         PE3h33grNeuRI8na5tkBPwOhPtZFY1LYqMSD9BAXnySdYfXPe/p+vGH6x5ejUpKPDyi9
         7wB/Yj5Gh0uEi5SdJHMJ7BjG7JXWLZS+jRHzo8eFvtMBB4g5sW5leAM/6B6D840icXOD
         uvAasCC75geNJv2XMe3htQ+R6He3zUU0MUgz51o9AP86ZTACOx7P2FWlTHybct3SnVqy
         cKbvs58yBQcdamp0wxYkw8sYtm5U8zg3vQI4XfSwBf6knj1O4PyDrsKTXK5qHfl+jfGg
         vP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606090; x=1791210890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=btxyB/WLVckW2FMnL9chr+o0X+NcLEk/lDCNp3gdG18=;
        b=seheaz0vGhdshPBQCULUfTDXygx7gQQlx4NbBg1izgv8AMlTyItX/5Xwa2d5FHipLG
         +dYmXxmRH3p2XyXBE2HYWxuJGarlQQ6jMpvbzCyvdVcimMNYP/cVnubn/+QKRYe7ND78
         Nyas+FtU+1soyYW78vz2AUazz0rC5xGxBXM7XqAOs0YxOEppQaez6u4KroqA1Deq9Ev1
         kMXXYaOgMfJkNUgf/+nHeSRuHod0xL6J3f8zQja6UPNvtJ1XUSnvFeO45HQZTbmet+l9
         rHt0xhNtHTeUbPuFOC0qAT6najvohbqFnL8hroRCv9WkvHUKJBzkorUBC1SYkNXsw4yr
         tmZg==
X-Forwarded-Encrypted: i=1; AKwUvBzKvOZisvAu9qNiJHOVJRYzVFPCuXeIskDcR0SSsHaxixR1xDkHSUxvHgP1NxbudOqZFcU2DVqPeq8G0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIyCmw56/l8fuw5byYmMmBpLENNPnRCHcuT22R6j3q5cASPdpxl
	6sBvlMZBuLZvy8nRlyHFujEyAHe6dmdkson3aywWq78o71k6khjmhrjz
X-Gm-Gg: AYBFou3sItORlJD0aO8NZ1ymvNew+GmVr/cAc+bCbwLRwEaOr3JOKsYwQc8bTymcYnC
	QZ7NRHPrnbLzDH1Q6zqYiLtF0XaYmcoZyvc1O3FroyuYZLiif7ozSVwnEmZVv8wa/xfASjc4rCw
	JBbBltpy80XhgItMuGoOWmh5VqGysceql1KWyYF008nAYkgAwNcoLLJqo4pL/Zp67t//chUMiqk
	2YYazNPw1Dnp4MlFKW1Om3EjZQ9pUaRqr63UXmzGM3d+QsdCO0ejYDjUyKy2QgNtQSUw/3orSoc
	j6pHg6wSCAbWE1vNjf2tttCqmQ3XhReWk2/Gc5L1rGJNpTiQGl7tehC7NzX6BkqBQxacWUI3AwZ
	gbleUWW/8fHIq0vaYh5xPLEVQPsvxRFUR2gug2BAxtt9iA8tlE2YmR3iz1qGnTaGWXXDGfsHZEA
	IQlzMuxmJ61SN2AehqkpY12NfwMzTKfIFJUe9td2wpyVVdMwYOV59EyXUnTs3Ul1D76zX66u4cb
	pyTsuS8lm1W2m4c7zoQsUqHnUSkt52Og4FE1tP2WxJ//KWw4/r+RQ==
X-Received: by 2002:a05:690e:d0b:b0:674:13a6:4d15 with SMTP id 956f58d0204a3-67413a64e76mr2852568d50.3.1790606090098;
        Mon, 28 Sep 2026 07:34:50 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6740efc941csm4577404d50.20.2026.09.28.07.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:34:49 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
Date: Mon, 28 Sep 2026 10:34:48 -0400
Message-ID: <20260928143448.757683-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928115713.GD157191@killaraus.ideasonboard.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com> <20260902002553.34839-4-jordan.mymail@gmail.com> <20260928115713.GD157191@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Laurent,

On Mon, 28 Sep 2026 14:57:13 +0300, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> The device implements an interrupt endpoint. Does it report control
> change events for those controls ?

No. I checked today on both the Tiny 2 and the Tail 2, with the uvcvideo
status trace enabled (trace=0x200) and a stream running so the status
URB was submitted. Neither camera sent a single status packet during
commanded pan and zoom moves, or while its subject tracking changed
pan/tilt and zoom on its own. GET_CUR reported the live values
throughout.

> > The vendor has been asked to fix the firmware (support ticket #8220,
>
> Any public link ?

No, sorry. It is a private ticket filed through OBSBOT's support
channel, which is the only way I have found to contact them. I have the
confirmation email showing it was received and is awaiting a reply, and
can forward it if that is useful, but there has been no response since
2026-08-04.

> This belongs to the commit message.

Agreed, I will move it there.

With the Assisted-by tags and the shorter 2/3 message, that makes a v3.
Hans, let me know whether you would like me to send one, or would
rather fix these up when applying.

Michael
