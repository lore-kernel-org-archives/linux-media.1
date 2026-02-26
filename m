Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52A43A1E78
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100947; cv=none; b=rPbZO6+6vCwIfXsxnb0UDoOl/74Qpur8HH4s70zBJO2CqTY6NveoLLOf+3J6EAhppZ1WXsHLL+hDLb6xGgXI/bab8A6j9Vk7P5q5MB2rH70PnczZyIDzEdXkoIeQnHPuZU8h+t/pq4sIf/GFyDV9+wsVbu0zVISmr8Y1m4VaMUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100947; c=relaxed/simple;
	bh=q5UaMIJRuKgZRoyBPtV4dV4KthE1+lcpZ+3WsxmPlgk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oA/d/2JV2OkEfO6S6aSZNtM83rUpAUZfYzCXggG5bIjI5Z5WKOB7kpMoq3ns4Jb2N0/ECs4mEX585cj7ahuZK1fZPfJ6wCNwKdfbQjTcHKHY+0msExvY5JVVviKuUBq/de9RSpeMttAyB0DmvaU9oOewvPBCqQ03DaayUGRD02s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvYOt-00010z-VV; Thu, 26 Feb 2026 11:15:19 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvYOr-002iGl-28;
	Thu, 26 Feb 2026 11:15:19 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvYOs-0000000076y-3rdN;
	Thu, 26 Feb 2026 11:15:18 +0100
Message-ID: <379b0a916174bf34e95fb322c2d1375dc9b4be97.camel@pengutronix.de>
Subject: Re: [PATCH 7/8] media: i2c: ov08d10: fix some typos in comments
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Fend <matthias.fend@emfend.at>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jimmy Su
	 <jimmy.su@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
Date: Thu, 26 Feb 2026 11:15:18 +0100
In-Reply-To: <20260226-ov08d10-v1-7-c3a916368123@emfend.at>
References: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
	 <20260226-ov08d10-v1-7-c3a916368123@emfend.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Do, 2026-02-26 at 09:56 +0100, Matthias Fend wrote:
> Fix some spelling errors in comments.
>=20
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
