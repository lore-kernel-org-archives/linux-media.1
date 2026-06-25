Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B2936C9EC
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380871; cv=none; b=jin8LdliRXG1eIX3wwoNrQ58HAQZTdw81RbiArqwMJYmsUvn7O+yhKq4q5cnLnKjvFGsnGeX1HAqASVKyH7P2+n4MCHwzJ/murZja+mXOdS3xO1kRMRnVzgZuoG0kF0ENrNmLnEjo+QmuHVmv07sx5ihYiNRzB8tTe/xZ+korjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380871; c=relaxed/simple;
	bh=l9uarfYYTt6rzHCXNwF4p3X8UwtJ6REynp/VVdjjqy4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=X+ibOWbfdIed0PxA8P5tuBo+vRr11QB26ztokCc+h28QSsgaQk2b3s4QDrFhleo/xu+05ZE86hjvDNEBCsvN2uXQjsMqvjpM4JAKNbrmxRc7IftF027cUfPj4Y10R2fu+hoEDo2nAG9nZ3RQr6cWgW3K//oOYM0Pps1kcelii6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPMuD3ZI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPMuD3ZI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBD11F000E9
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782380870;
	bh=l9uarfYYTt6rzHCXNwF4p3X8UwtJ6REynp/VVdjjqy4=;
	h=Date:From:To:Subject;
	b=VPMuD3ZINGVcRnnqEJNfRZyGbPhgHzwXMSRQp/oGhIms213t04RyBnUt8gtCy7JI1
	 0nCJM3Edc3m7RxROlePbi1Gg9P5g5w7ojN6x8cHukeaNF8c9rYIe9peu8EXYAqeVEP
	 IaQUDs/CoR9qWdHh77TRZV72nAtXew9aodAcAPzaChdgQPvMqR5GP8CkrYwkkwjrXh
	 mkOim1IvCCAV0ChLr1wQ/vOI+RYq8e3fXz7dIUQWhWz/uhWhrSqf4TXLttAKWmCkei
	 FnA8zdMKGRDb8Z5VxFyeQt30yHGC3PgHMZyOBffhNuZiub+JaY59sUG/PT/CDFuG0d
	 JNihFFs1i4tkg==
Date: Thu, 25 Jun 2026 11:47:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: linux-media@vger.kernel.org
Subject: [ANN] new mailing list for CI reports
Message-ID: <20260625114747.22fc1ec8@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi all,

To improve how CI reports are handled, CI e-mails were moved to a separate
mailing list: media-ci@linuxtv.org.

Currently, it covers e-mails from:
- media-ci, which handles PRs and submitted patches;
- Jenkins, which covers mostly userspace apps.

Thanks,
Mauro
