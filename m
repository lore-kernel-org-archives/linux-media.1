Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216683;
	b=wAHqzxBtYIrStlEfcCrnOm+dxIdEPjt/1uamuT/laJeuQbDu5k8YLxYSEh8uY/RSTIY7
	 H/AVdwqDKErPyKc/W7ORKkNEGpth1vhoE7gUDgzHjWcEtBTp/n+TaVRq8KJTtF1xjyX4w
	 80lkBJEvW/t3SJvAXDGrXOhubr0Li566JV+oe4FXHFYlNFmv8DSGUSG+8ZiRyp3xC7scF
	 4Oi8NseeX2G/YUUeBmbg8CehuiQh7JIOW43tCGi0bblyZhHomSAuxI3qzbLOqmtWWvyOf
	 8mLnotCPp9gST9mt950uLFvxYHv7TyUDe2VlGlm7D20QvAf/u7L6OKEn0TuCljxLf/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216683;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=AMvdsJFzYJevO2T5BugHtOY5r9UDNyXdokVGV9enPe8=;
	b=aZLAv+X7zzzp6kOxRvrb9gGJVr+und3w+nZXtf4BUlJd37Qha97F84ABEDrI+PLfQurA
	 +WEdia4oDjoc/T2J38Xk9aNVfiIF4uXcMtsskIug1ek3i+n/DZUiAxvpJFnrbQ/Wh03n7
	 38QOlsDmIk/cdLeuDs+e1aMUb0mqfU7byaS5ol04PRNcnpCfoZFrmDk8j1b7E3dhslGs5
	 +Bol3BPV0el0IrY3xDNXcNhdYUuoaPF6qFIrVbQ3b5S99RcSuINF3Egzccvy7UBpfWKln
	 0UOmnb2umRACmS8bWUDF5vi4AWwQBnW82dljb8E7Zl3Z3iFT621HNOwzXTrryAwU8PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21757606A681;
	Fri, 20 Nov 2026 23:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21757606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUXrc-000000002XZ-17Ii;
	Fri, 20 Nov 2026 23:17:52 +0000
Date: Fri, 20 Nov 2026 23:17:42 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] media: rkvdec: hevc: bound the RPS reads by the
 control size
Message-ID: <awDU_2e2yIVP5VMx@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
 <bb9c44d0f56221874b105394169e5c377ef21b42.1794645268.git.daniel@makrotopia.org>
 <6ae6d1101d3f7095d11462579a5a3313153533e6.camel@collabora.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6ae6d1101d3f7095d11462579a5a3313153533e6.camel@collabora.com>

Hi Nicolas,

thanks for the review and sorry about the messy text.

On Mon, Nov 16, 2026 at 08:49:44AM -0500, Nicolas Dufresne wrote:
> Le samedi 14 novembre 2026 =E0 10:22 +0000, Daniel Golle a =E9crit=A0:
> > The RPS helpers read num_short_term_ref_pic_sets elements of the
> > EXT_SPS_ST_RPS control and num_long_term_ref_pics_sps elements of the
> > EXT_SPS_LT_RPS control, however many elements userspace passed.
> >=20
>=20
> What did you want to say?

The number of RPS entries comes from the SPS control, the entries
themselves from the EXT_SPS_ST_RPS/LT_RPS array controls. The driver
never checks that the arrays are as long as the SPS says, so it reads
past the end of what userspace passed. I will reword the message
along these lines in v2.

>=20
> > Beyond
> > the passed elements they read stale entries of the control's array,
> > and past its allocation once the SPS counts more sets than the control
>=20
> More broken text, can you work a bit on your messages, be concise, precis=
e,
> don't get into details but into the understanding of what you are achievi=
ng. The
> code is precise enough.

Got it. Reading it again now I understand your point, I may have been a
bit too excited about my findings on a Saturday morning...
