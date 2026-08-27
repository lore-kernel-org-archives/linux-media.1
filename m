Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B035F4C0425
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854775; cv=none; b=VowCpbSzr3VpadX5P3A2E5LWREEDjdiYxwDiOE5836qnxcG8mQv9ytAF4NRKNK+1NJ/M4xkQcWwI6Opll6U4kmzYMrCHmMFIGk7W+H6lW37WX9kEMx2FWurs6sZPGPS9ALLv4RrBjMUy+er7LGG5nqizWSQE9UZwQUwDGEdDhR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854775; c=relaxed/simple;
	bh=b00El0lY+1vglMoXPEaunV+c5xkWsWC2fZx+ObgptIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fd6wLSJuB9mOsgqHBo4XF9F1XdgUjXOF3tOvxSgPe+UEWnlGaAzJ2IUrsuzOlmnvYiXpFq+5NvI5hmZSWA8AWsQSvx8b0nsTGwG/G285Ddt1Mf88Mga98fsVBTRlJxSDD9pxbLK85AOPYpXfRfU2ZmIIQftoL1DMvam33GA7MYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQZ+nTe7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQZ+nTe7"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47db714766aso986762f8f.0
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854766; x=1788459566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0N7A4g9Z6siCzGcIeQCrf9aJnqqFTqpG+UHLQb2Qlo=;
        b=KQZ+nTe7VVHpraq5U4Ajuk8jONMqyC/1Nc6BXYEY/UoWyqZuC0c+Ur2iO/S7uaQ+ws
         +MzmtGk1OfgaYtFv36TiQiQtiyuVpcqtoWfKdaxFVEzMvFazOik4DKpkmibnmNlXT8iN
         DfMUOt8UtZxj+FNQgJUTkSb6r+CMCKQYhFbTb3DZQDpfXhfmMtDbZc7tjxMu37XNOc/P
         8LuA4cORat24/HyBbR7LNufYHSGDa/HM20QSkydxBuVjdoeuYs63gJVdDrsk/pIbDpfZ
         5Ol4w7VIkVy6hAXo37z9J/LwkPUXZX1UIaAHY8GGW78wG/PcftUYgFQEqcVWi2SoLTvA
         /MtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854766; x=1788459566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K0N7A4g9Z6siCzGcIeQCrf9aJnqqFTqpG+UHLQb2Qlo=;
        b=MOTmFXyUtlvZ/aWL5EDchprEpOziGNv6wAWIXRz92mKBNgGF+nuujPiLxP0Zgzjwfj
         i7iWJLlvSuEQzZ42qYNWOrn2FwpHR+cVdQp6jjlO9gWh24lK1uGu538VBC2Ftqb1EzYj
         HAxBaO/N276DdvqZMM6h0UW8vKYQRA4Am9pvdbRdTWAukHdBfHVvJsrHoIvdFJKNCc5Y
         YPZZvRwlgI12eb6dfc+TX9xEyvjRQlWDY7xsn0djj7H78bpmis4zriu74psCAQFTS6uP
         7s8UUYPQvpv8y/5fVQSNXUYbS//m0QJ4cZLHRaFMlaoqzl15JC9KXIQ7ISELxu8LNyKs
         XaXA==
X-Gm-Message-State: AFuF++kw7pWjkK4DBiMG0wYmMU6fm9U21gNwgfRI8QSYyFVplkFLixa1
	pa+00B8PUfB/lTIQmv7TIG9lv+W+sIWk4psOyUMrdeunjLunt5fglt36
X-Gm-Gg: AR+sD13kqx9Tu+E2zund9MKvTKfnOOB+yLAdSt9LXeHQxRFjFLI/Po0u4Rp7nq1yXIR
	XVMfjA+UR8Qr5pRcjO0NVfThhbTUGmFnuCzdVwv3zIZsE/gW2pPuzRyh4yEcw8Xa1KDyqKwe4iQ
	+2FkJcBCxY3dJq86DIMYDE2AVXBHEH0aNzA/Nc52qVa6t3+7EeBbVRSaXjlagxmmr+5bMHU1Ab4
	SFRsK9RiCRvIjqs0vTjzscXmCePlvjbJ7c0SzMdMP44vkFphkzhkm6CGn1vsppt08Be1um5PlGb
	UjD3EP0nvQV6HLBAbmkT5+GstV9JZAxdvyR0NlQJD8p5u7R5/26omyXB2XS2Vc7Vc70Z1FM5bMs
	iTIWJ841bLGY1SP6XnPTUJvFc5So6aEofId17XptmVjcT526jHSzACVqlogM2nNBI9moPDUTznc
	Jqhavj0Q9Wq00udhEzaHF4RwzZN+fIMu+yes31JjuLkyD/SU2ywhAHnFhwk8nvQ0LiQXvWCuO/1
	m0xKfMSa+LevBmAZQqYkig8wkRdT/Y1h7s6uanfQuod
X-Received: by 2002:a05:6000:4a1b:b0:482:e4bc:51a9 with SMTP id ffacd0b85a97d-482f75789a7mr1643068f8f.4.1787854766117;
        Thu, 27 Aug 2026 11:19:26 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab1f3sm11158603f8f.11.2026.08.27.11.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:19:25 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Bingbu Cao <bingbu.cao@amd.com>
Cc: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 6/8] media: ov2740: add manual white balance controls
Date: Thu, 27 Aug 2026 20:19:22 +0200
Message-ID: <20260827181922.2432231-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <BN3PR12MB95696150D1DC736824104D2D8BAD2@BN3PR12MB9569.namprd12.prod.outlook.com>
References: <BN3PR12MB95696150D1DC736824104D2D8BAD2@BN3PR12MB9569.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yes, the three controls need to be updated together. v2 clusters digital
gain, red balance and blue balance with:

    v4l2_ctrl_cluster(3, &ov2740->digital_gain);

The runtime-resume path also applies the clustered controls after the sensor
is powered and initialized.

Thank you.

Maurizio
