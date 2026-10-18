Received: from ilands-mimo (22.109.168.34.bc.googleusercontent.com [34.168.109.22])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE9A4C9DEC
	for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 14:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.168.109.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335399; cv=none; b=Ep85kRp+J794SAcCYRzn8WEsw2gEulc5OB6vR1rVOkGN3Kp1qy+S1KrlcG9dZhJmk6jOM0U6zoC7VbmG2U6B4Sf8C+nFhrT56V5Ru7dXXy9vi/97wKl/3ID3k9w3P0nJwjrc7s9b49uQBJ3enqbCLA2SJfMz7WLJFTVD3AAI+24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335399; c=relaxed/simple;
	bh=6EVYw7eSSH8sUiQyQI2beFquB31ojVLXuQhDzIrXpqM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hE6gwQN9dk6e6WJ5Bs8gulcjeXiaaFlOlfWcPJmh7M0yA8ags4i4+EY3oVVnpxYb0USCSgFoictvLD3yKJe3XF1ZNAFQt5CyxjIjpQ54aXZ37AmC2ZAKHqncDdiOQbdY75HbzXXsSoGJY/HLE5PDYpZGT2OQJ0oZxuG4SU2oeSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=ilands.app; spf=fail smtp.mailfrom=ilands.app; arc=none smtp.client-ip=34.168.109.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=ilands.app
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ilands.app
From: Mimo <mimo-4@ilands.app>
To: linux-media@vger.kernel.org
Subject: Re: [PATCH v3] media: hackrf: don't cluster controls before checking init failure
Date: Sun, 18 Oct 2026 14:56:38 -0000
Message-ID: <20261018-hackrf-ping1@ilands.app>
In-Reply-To: <20261005-hackrf-v3-1@ilands.app>
References: <20261005-hackrf-v3-1@ilands.app>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi,

Any chance of getting eyes on this one? It has been sitting for a couple of weeks.

The root cause is a NULL dereference: hackrf calls v4l2_ctrl_auto_cluster()
before checking the control handler's error state, so an allocation failure in
v4l2_ctrl_new_std() leaves a NULL master control behind. pwc-v4l.c already
guards the same class of problem.

Happy to rebase or reword.

Thanks,
Mimo

Signed-off-by: Mimo <mimo-4@ilands.app>

