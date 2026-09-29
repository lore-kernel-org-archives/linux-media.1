Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDB03CF021
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690069; cv=none; b=cS44yCcPn79UW+LoCEqW75ldT6b3bPuerSWTBRJ9OM9PD7eyEvM/NcpuN/6jfR2ioJfYS2az3mmpywnHIEP8ChWULHwTsB5Vy3C/u0WDw7iQ9R0GOosgPgmxxLD5ectt8sE9LTbvktB7n7tpZS8FSdeYiJJrM/E6V2IuztmDA10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690069; c=relaxed/simple;
	bh=CW9yN3YZmbe25hp94V4rxhoU6iFYnKzB87Z5cCPMl8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RG0ZCss1JKK1FbsNMmHeENp5WHASIILFIy9SjU3fTRVsP5m2H4Tb2zVEyIi2RgryIU8QWFTZhltIpLc7U9iV3cxDGY1H9JwwNpw5ewGCqcogh84PTBpi8h/MPgiz+4ZY46hQGzHv01scQYE7wseaqYA5Z+75uK8glAeKNePR/LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYIZoH28; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYIZoH28"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66f7f72a284so4327428d50.2
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790690067; x=1791294867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CW9yN3YZmbe25hp94V4rxhoU6iFYnKzB87Z5cCPMl8g=;
        b=AYIZoH28nnVLCnlmaqQ3RUUJmKTYGvAHfvkjQCA+naE0ULLZjAnFu88Eba6BPmAUmg
         9abJZqb3xwsJ/zhc7qFMD+Dlvyjg7mnX8AEIm1om2MGxbQXxpgNCJB/gf5X8xVek+eZH
         s9lUtoGSjZJlAl4s9HNW0DBj9oQGx7DFKlqr2iG024jzEXtAN+dkJuqoOFgYK1CDYsLi
         UTYjZo4XBpd/U2uCMBWy7SYusUlwN7na95FljdvGi4TuMfTH3RTn8GUGVgiFHGmKIo/t
         jonFUfpOuCTmw8ldWCIqzxCCeCzCdirb9/K2rqBWkcKGr8dTtS4qEIhfM+F/XYU7l0JF
         ZGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690067; x=1791294867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CW9yN3YZmbe25hp94V4rxhoU6iFYnKzB87Z5cCPMl8g=;
        b=ogfkqEi/fbmRcRFlxTQs9bEIp52rnpmiIaRJcdM/o7PTvCOQVRkzWCs98TTbR0X3sd
         DcqSORlXYOk9KHwLJ3pFvToJTpc/0yT0FigNrdOez6NFJ0GpjI5C2OVt5U2YNERfV3Hb
         ZfipTZHrPP+Xn3SFHZsODnNGTDBhiihk4pt47tnfCBdOe3jNt4LFuB8g+fmoXBLKjruh
         Ej5XJS8gJzuec5bUiTJeNfm+N68cAYnnBL+g0TCAq/Pj/GQWYMsX/56BZLiQ544DLU3G
         nzSPEASBo4fB1KZy2sITyH0IBtErGEWgk70zbhn9QSSlA0nVKsnBecMs3oDW9mhWKpoa
         4fZA==
X-Forwarded-Encrypted: i=1; AKwUvBwjaweGiZ/9TABjZnVxsprrCxpD7M3RJQhIAUvimtd1sY04vZeCnwqPgbhVN5o4s1mfi8viHCyDa21Yig==@vger.kernel.org
X-Gm-Message-State: AFq9FYI4qTxc5lKjrXB/zAH8Tn0eUF4407eGW+n8ptIFJZXloSuqlSlY
	SvNMmbR14RGewcLv2H4ugsjTPmgRQRhPPIQCfdfpiq6RBdWyb+5/WL+L
X-Gm-Gg: AYBFou1+AaAtedcOfAH+aHtOH7zfXirGGGlxJPPGXduDE1PiSNoU/1ZypBIqdsy1Bnb
	PD65N+0xP3GYt5Obe3W9iD8GFl30nSIoDC9s/fs38CuXZaz+0vQfpmHG7OmaQ03aJxEFDdCxEjk
	wyE2US892Wybm6+uGlg+GPs0scn3irhIbKmTOJBebVVlOIP7cm6l4ZYYEztSmkyxp9pn+dVu3OM
	YFw6USXLpYEdO8dNvZAeR+iR7sUvFr6QC8o2K/9ePfbFKeH+mvaTv+90R6w2lmKnnDYZ4uUef9v
	BUSTfQ9K5BQRbFG/c2XBEB3cWy0hj9SucSYQy9QFqbE7M6f8xkpgnqrFEmrb0OFSWN/qpwNNKDI
	qqeD/U9YfbhP5P9TCX/uKmELs7i/6Y2cLzoXvf4lm+DrJE5iE/TJsw09bMoDbGWi1u88agvy5v7
	2ahW7WvnnQP/pxhOAolZbXUD4TQv0SSXFbE5AbLxMJwg9LzD3kcmhYgymyRV6jgh2U0VIsfhIxG
	HHKr5wivTTRBESPc5uL1hV/igfk/T4ORFyR2HgcN6Fw3do4nNokWQ==
X-Received: by 2002:a05:690e:1c0b:b0:674:1d59:a129 with SMTP id 956f58d0204a3-6741d59b018mr4502993d50.93.1790690066952;
        Tue, 29 Sep 2026 06:54:26 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6740ef31df6sm5943091d50.13.2026.09.29.06.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:54:26 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] media: uvcvideo: report AUTO_UPDATE controls as volatile
Date: Tue, 29 Sep 2026 09:54:25 -0400
Message-ID: <20260929135425.976157-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929123422.GA349401@killaraus.ideasonboard.com>
References: <20260928215021.819064-1-jordan.mymail@gmail.com> <20260928215021.819064-2-jordan.mymail@gmail.com> <20260929123422.GA349401@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Laurent,

You're right. The driver already sends the writes regardless of
EXECUTE_ON_WRITE. I'll correct the commit message and add the blank
line.

I also missed the restriction on write-triggered CH_VALUE events.
Reporting VOLATILE needs corresponding changes to the event handling.
I'll check the write-notification paths, including asynchronous
completion, and test those changes before sending v5.

Thanks,
Michael
