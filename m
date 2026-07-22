Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B298023C8AE
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 04:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784693169; cv=none; b=XdSuSO/P5YzEiCVPGZr8V0IZIaKrVZtnZp4uErtOl7scEIYB8+BeAMJTI2RKbBZ+ddnPLhlj4H3JMGSwuFkZib+5A0a7q52MafZ/EFk26cZ9ipZoKu8XhO+cRGpnsxzRyKZmtpANH+Ph0AatmdwrzuBEw5wsZLaU0XizNHz9uzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784693169; c=relaxed/simple;
	bh=6jtXqLSAARYK3BswstCo91ZoWuJEQSUA1pR3CcbwDSA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PsrxxJDzPJBvXCkZuCxCh7MhG9AERBP6bKrltO9orXAMYG2g680SQjtqnmtpG30rfX1vGFCvSzm/nS1FH6F1RCo8TMieWcZ+ro0Ooq70dNKQ+Lfa0TJYe7PPf3VBPNMozgU1FA1ecRCeyZ11cjFJnEM4mCuBri0HgEt6lAG5N1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p7vNoF+A; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p7vNoF+A"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784693164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jtXqLSAARYK3BswstCo91ZoWuJEQSUA1pR3CcbwDSA=;
	b=p7vNoF+A3/UjCEcvMnrgys5CYoqLSuOuEK9JFroJu/Th2Swoe4QJ8yFpFrG8VjiJx1KmYn
	kndywntHWALgsnwg8SgwLvjFICU4MFjSpmayltgMGQ2Qe2VarhS8coqV/MNFb+FN4+52L2
	9ReGBZaR02ngTfD9sJ8IMKWJPMp6b4Q=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Linking Patchwork with Sashiko?
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <20260720140817.16a8924f@robin>
Date: Tue, 21 Jul 2026 21:05:48 -0700
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Derek Barbosa <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, users@kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Message-Id: <7DE3083B-0F7F-42B5-9D6F-69EFCA3BA8C7@linux.dev>
References: <20260720140817.16a8924f@robin>
To: Steven Rostedt <rostedt@goodmis.org>
X-Migadu-Flow: FLOW_OUT

> On Jul 20, 2026, at 11:08=E2=80=AFAM, Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>=20
> =EF=BB=BFOn Fri, 17 Jul 2026 15:32:57 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>=20
>> Where are the AI companies when it comes to addressing the massive
>> underfunding and maintainer burnout problem, to help doing the ground
>> work making the kernel more secure ?
>=20
> Ask Roman how many people in Google are supporting the Sashiko project.
> I believe the answer is 1.

It=E2=80=99s slightly better than this. Elkin Cruz helped a lot with bringin=
g up the production instance,
the initial Claude support and several important ideas including the early i=
mplementation=20
of a multi-stage approach.

And there is a number of other googlers who contributed less directly, but p=
layed a very
important role in various parts of the project, including providing early fe=
edback, helping with
various processes, etc.

And btw we=E2=80=99re hiring! (Unfortunately google in general is pretty res=
trictive about being remote,
so you have to be in Bay Area or Zurich).

Thanks,
Roman=
