Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C183C454E
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 19:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364493; cv=none; b=m03c6HrTrbJFKGIaOMOWqwy4YtNLJhb1rXva4BdNcLM11bHpasmE5iOsLShZvqSpOyZmJ/Dl5oiUQsjnGyvZlsPMSa0pnUW7UYPUsiQwSeSB2LEuiavYuz8gGSIRKfSQIzkIqqpT7N28MeOLtpsejsa+rrijlUbqwIKdWZ8+p4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364493; c=relaxed/simple;
	bh=kxURIRZzgPTJfdLg5CzkMpeoAgOAG8CcHM4nRKTEVRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtJQwYC7XZEj+TS6zAboB7uL1K1tCB1OMLs2QCu1NSgonlsp/1citILEs2zGOINjHt/uhGHky0PxHo7FsONyl/8GbCMrSishDdiX1JTaZse1agY606Zd/yPx7EAP1CQdSwd/W1pABUGuymrAPJfNyA/257/JsKUIB0KobwUrDNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QC+1nhFS; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QC+1nhFS"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488780459e2so1244194f8f.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 12:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364490; x=1790969290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLkp8tKPyA53T/OKC2x3SgMSN2485FWk3XxTVjLfsT4=;
        b=QC+1nhFS+BzkrCUK7Wskk7yNFQpF9SqmWt1XUVkSfT3bwa1jYwGQimUnFeP+2JrRHo
         sesnXt5ftg0+lT2sZiWjre1N+DYI2dccYG1cQWCdLzmC7YHWcVDoFCmMxNeIzfTzwZJd
         IWbUCFU1bqk6wT9v8OByF9YKBCso1lM0CzC3VyN1jvUWrLFCnHtPbsGN1qPagMRsfvH8
         qPJAzGJLeehg44XU5k1I68vnH7Yyj+z6JwQHV/GsO9oApMuHIl+ZfsX7gaAeNeSD4ImZ
         GJVejEcoBbmhPurDBP5wNxD7OT9A+pwkul5CpbybRYXyr3HE8S/77YbuzfmXPst8ePyP
         Kxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364490; x=1790969290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLkp8tKPyA53T/OKC2x3SgMSN2485FWk3XxTVjLfsT4=;
        b=fB447JS+FcNbteQbhfOIyLsWLVRN6okdEN+845Drv0hRTPf6YmhAy3fc/rdPSrJUI6
         liIQHrf4mubeea9Bua7wSYglOHd73SnwN9TBt3MdICSv7a/Q/Dqm4FiSWMUBrhStxdeG
         T/y8QSQ+zDwuLTieMVIKieYzPz8zYGe6bqdXpDvd8VD0RfELE7FLEvQLkxYsuq2IbPtT
         dvEzJrP7TQeXVQCIN+tdvWboAP25v77lou1+D0au2+Ay6zAXW4YjdmvizVASrUzM81+P
         mOITcPdqXo5Q8YXe8N5B55+iWtq/arWuHFVZWLLfWjd552kV9ji0OY7MSf2qtFmGMhEN
         JSHA==
X-Forwarded-Encrypted: i=1; AKwUvBznxLXLWZmT4tBNQ7XpR8UkiRKaHnlHhe8F8Zj9YOXykz8FrllLHKj9+z3nnMLbgJ6Hk0aKycVsRdPTgg==@vger.kernel.org
X-Gm-Message-State: AFuF++lDB2ndP9FL67A58mf6TfK1p9EU55hg17pfiSoHTeyFpegkUDiH
	KlJuHPiIHOtU6Z/7cdRLFLqGwwlIC+4fFimewEmGQnga48+/XmfPJae7
X-Gm-Gg: AYBFou3ZeamnMbw4IODfXy+Si502HUKLXkn5YBJQpPJy2SnyOKQIdNk82wK1mdnXvPZ
	nKxgWS4ovs3i913ssXowmixVVJrzpanWcZTQo0mPugok4B18j9v4zW8b8qiLjaHlgQ9FEvAoWa6
	mcauXLY3kK/aFL4SWFdJ9vNe5f7F6Vkx51wpuazetd049l+Y43otvR9dw+/YQ/L96fZeLWtbki0
	B/1GztB8ngPtb3gRTZ+7hFzDN3jy9L5b0TAC6dChWJqfoYLbBDogyti3nbEDqssn0s333vK5VLM
	4X4u46GckBxJeQS4wySi0FMo7aiEwTrCd3Mmvpt0lJ7S60r8FUD7uCQbqPdyveRz/tj6kg9r3mL
	fESSvnRqbjHE/gTmKu7ndQZt1x9TFVOox/CtcAFfnNjiDSGj2+QlPLM7sd7uM06Z6i4dv8bPrtw
	PDMEsBQsVCO8L4iJ3MGTP1dIo4ZzVX8flu2bfmrVKPzILn6EdFmFhG0pcRvf+gxRmNnjl9WIpX6
	6sIBuMF055brrRzUH8lR7c7UTScOZ9b38qv4QYYWhsO6p5DEZMJBQ==
X-Received: by 2002:a05:600c:8b71:b0:49f:dd6d:79a1 with SMTP id 5b1f17b1804b1-49fe6701ee2mr106024745e9.26.1790364489603;
        Fri, 25 Sep 2026 12:28:09 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff21c38a4sm39369075e9.2.2026.09.25.12.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:28:09 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: dave.stevenson@raspberrypi.com,
	germanpapulindez@gmail.com,
	kieran.bingham@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test for [PATCH] media: i2c: ov13858: add horizontal and vertical flip controls
Date: Fri, 25 Sep 2026 21:28:08 +0200
Message-ID: <20260925192808.8114-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921124444.79396-1-lsa.uz@pm.me>
References: <20260921124444.79396-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As stated in https://lore.kernel.org/linux-media/20260913185735.6607-1-germanpapulindez@gmail.com/ a previous patch involved in the correction of the orientation of the camera, didnt manage to correcly flip the camera specifically in qcam. This patch seems already upstream (or at least in linux-next) and solves part of the problem, but not entirely

After applying the patch, the orientation was the expected and the same as previous test with firefox and gnome snapshot, i also tested both apps again and no new bug or error ocured apart from the debayer bug not related to this series of patches

   Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>


