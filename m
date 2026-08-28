Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730ED358D27
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 20:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950469; cv=none; b=stT5Flty57hoQZVcvtlTrcCLoYr7+FXd5KU6rtQY6mc/1IFzR8sge3iIaojEgaBiXvD5GHx5XmUJ+TByVgoelJ36rVIcb07AA2hXMEGSedIqFabeeR7+neeSOOWojnL33hKu1LWTdfmO99ZJtD4zjECCV2wayTp/SnvwHdeQw+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950469; c=relaxed/simple;
	bh=fhO/IrhYIm8dl0ygwuZulHKhJvaq6wBppghEv+lfuH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvQTbdzVRE5IvvZTQxB3JvZSlB7EQ0eFLfpuM5nkHV3LwSCHivoXiSRDZbw12llB9V0iInauyhHKbYboTIlO0j9pJvSPZ4Uu1tD+UdPRrBlbxgmGtz11PvTWVnVXAbQXGv2/bOvrR5MwB9vp75+fZ3TqzLIe6B6wZVTYEtNGa6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEtYjKMC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEtYjKMC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499840a2575so9182855e9.3
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 13:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787950467; x=1788555267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhO/IrhYIm8dl0ygwuZulHKhJvaq6wBppghEv+lfuH4=;
        b=pEtYjKMCLPRad9lH0p3xVoA0eQrJ9/WPMoNGQ4N0PnQvO7y8IglX7uvhHMyVU0l/qh
         1Sk4ZBdvXuY45MWa2BfY+KTrZ2Jco2ffZIGPzIOb0AgSxip5WJsqwZ2bL5W0ik5cOe9W
         Apr5xOZDXyt3RaEP5rstCcba0AVyB+z7i6yWs5heu/GBeb4kHPt3pqgUymMNiXa0WPJo
         /6r+zrP3zoMQWmQDsFL6SJUwqnu8QaR7HbDuUX580G8aPUDVAUQYH/7kKudbvuKYgYlW
         BBMKddllBIM90VIvmn/fHQEQehOcNq8gWr57A7LMIz4pRDzZaOVrmtv0cd8VdvA8S+60
         mUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950467; x=1788555267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fhO/IrhYIm8dl0ygwuZulHKhJvaq6wBppghEv+lfuH4=;
        b=jYdU1dOp63h4vci/EGmqY0yRtbhP31S+MHlcJjWoIf0V7ID8SUjRj/fxxiimG9lyHg
         VLGEdqbD5B47jmBXGfwsYlREBXM0/46OzrWglbzPP3+GUd7Nz1PYBAwcYppklJi30bo3
         v6aLqfDuGHNBIDmrLptXs5SLyPzzwPK7f2cKAyViIFkqO2RdaNsprKnUQdXoQEHRSj1y
         tWGriNPYU9D6GgPLM8xkC0P/g3l9rzMtjbJ8VSj2b+RAB8SY4qQ80Ur3vaa/gCBqmym6
         fcUcljw2Y5uIJYXqPh5CVN92a5M1IzSu8HErLvfnz4K7jEaqfxCLrOKy2guec4+msQ2+
         XYaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfWLiKtX0fk1N6Daos+DyyezPdmDaFp4AOe168YCZTXzpU7VidnS7cSdcFqGlF2ncNiOqcS0giEBnIdA==@vger.kernel.org
X-Gm-Message-State: AFuF++n3m0UYq3ZeNyr3Zfam/5hIYNOmQzpKOyfmmRiz+W8jmedQlOBZ
	iRcey+tCLUSic6aR8k5BIkBaYm+7IreGZy3JkYOp+Km3oGvh6nm0ny8=
X-Gm-Gg: AR+sD12/g4wX9L9krqx/OY84AJ0FY6noWuAkbGzGYNdDehI7+FBlVBg/+r3gbym7XNH
	f4GeL2PlPkozfD9HxC8wM8JERPZTeyPcWCz2FiqJr4etFhnhjjIqyK17QjDf41xE7fs58eDQA3V
	ddihb1ZGd6pLMpffYcx8QVr373zHvj6o/r88F4X4QuD4Lupw1fejdKJ3MJJkKSXQ5WL3r2a22XD
	qZLvn9AtqzVAbRlvBuNozaBX6mlFpgJUmCl9fp3Wz9XaV15xn9/QnH0KTFAaiL7fZ3khRt868HF
	8pGTTWKonFhAD2KvJd4l+ewlrl0h/F1b/WQMTdnKOBNhbE2UJsUCe2kOGThP6Tn53vqWPBQEBs8
	irzt6dt6EMZIbZ/mvx4fbmLxw95CNIQHmy6dVPgWLJH1k3gwaKM4glN8HERrBnxorft6G99VrC6
	HFDgNa+V3hqbBThRlQrH7UIL4gOAXJvL3FCyVQff/zuDcxngZqzmEzxs5niKmLRljloqingRQyO
	KNilBhVV3lm
X-Received: by 2002:a05:600c:8b42:b0:496:c93d:e2f with SMTP id 5b1f17b1804b1-49b91c57d64mr155340405e9.15.1787950466515;
        Fri, 28 Aug 2026 13:54:26 -0700 (PDT)
Received: from surface.. ([217.61.227.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm108120835e9.12.2026.08.28.13.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 13:54:26 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "D . Manresa" <dmanresa@gmail.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: ipu-bridge: software nodes are never unregistered; PCI remove/rescan of IPU6 fails with -EEXIST and leaves dangling properties
Date: Fri, 28 Aug 2026 22:54:24 +0200
Message-ID: <20260828205424.154443-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <apGqPKMIk5kgqfMj@kekkonen.localdomain>
References: <20260827232636.93145-1-dmanresa@gmail.com> <apGqPKMIk5kgqfMj@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Fri, Aug 28, 2026 at 06:33:16PM +0300, Sakari Ailus wrote:
> The regulator string length has been increased to 6 since and I believe
> with <20260729-sp7plus-int3472-v2-1-cdfaf97ac3ad@berg.pm> (on LMML) the
> camera might work streaming-wise at least. There might be Bayer order
> issues though, there was another patchset
> (<20260729-sp7plus-ov-flips-v2-0-91884b81a8f5@berg.pm>) addressing those.

Thanks for the pointers -- good to know about the string length fix, and
we are aware of Jakob's two series: we have adopted his POWER1 approach
in our local tree and have offered him Tested-by on this hardware to
help both series move.

This report is orthogonal to the sensor bring-up, though: all three
sensors here are fully powered and streaming (the cameras work
end-to-end, hardware ISP included). The issue is that ipu-bridge has no
teardown -- after any unbind of the IPU PCI device its software nodes
stay registered, so a rescan can never re-probe (-EEXIST), and once the
module is gone the node properties dangle into freed module memory. It
reproduces on any ipu-bridge machine regardless of sensor state.

Would a fix be welcome, and if so, which direction do you prefer:
a real teardown on unbind (unregister the node groups, clear the
secondary fwnodes, drop the deliberate struct leak), or making
ipu_bridge_init() idempotent so a rebind reuses the already-registered
nodes? Happy to write and test either on this hardware.

Regards,

D. Manresa
